ActiveAdmin.register Company do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description , :image , :video
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs 'Company' do
     # f.input :tag_list, :input_html => {:value => f.object.tag_list.join(", ") }, :label => "Tags (separated by commas)".html_safe
      f.input :name
      f.input :description, as: :quill_editor
      f.input :image
      f.input :video
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :image do |ad|
        image_tag ad.image.url , size: "100x120"
      end
      row :video do |vd|
        video_tag vd.video.url , size: "200x200"  , controls: true
      end
    end
  end


index do
  id_column
  column :name
  column :description
  column :image do |ad|
    image_tag ad.image.url , size: "50x50" 
  end
  column :video do |vd|
    video_tag vd.video.url , size: "50x50"  , controls: true
  end 
  actions
end

end
