ActiveAdmin.register Employee do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :role, :email, :company_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :role, :email, :company_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
    render "admin/csv/upload_csv"
    
  end

  collection_action :import_csv, :method => :post do
    CsvDb.convert_save("employee", params[:dump][:file])
    redirect_to :action => :index, :notice => "CSV imported successfully!"
  end
  
end
