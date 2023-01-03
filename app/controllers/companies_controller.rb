class CompaniesController < ApplicationController
    
    def index
        @companies = Company.all  
        render :json => @companies.to_json(:methods => [:image_url , :video_url] , include: :employees , Serializer: CompanySerializer ) 
    end

    def show
        @company = Company.find(params[:id])
        
        render :json => @company.to_json(:methods => [:image_url , :video_url]  , include: :employees  , Serializer: CompanySerializer)
      
    end

    def create
        @company = Company.new(company_params)
        if @company.save
            render json: @company  , :status => 201
        else
            render json: {error: "company not created"} , status => 409
        end
    end

    def update
        @company = Company.find(params[:id])
        if @company.update(company_params)
            render json: CompanySerializer.new(@company)  , :status => 200
        else
            render json: {error: " company not updated "} , :status => 401
        end
    end

    def destroy
        @company = Company.find_by(id: params[:id])
        if @company.destroy
            render json: {message: " company deleted "} , :status => 200
        else
            render json: {error: "company could not deleted"} 
        end
    end

    private
    def company_params
        params.require(:company).permit(:name , :description , :image , :video)
    end
end
