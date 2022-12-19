class CompaniesController < ApplicationController
    
    def index
        @companies = Company.all  
        render json: @companies 
    end

    def show
        @company = Company.find(params[:id])
        render json: @company
    end

    def create
        @company = Company.new(company_params)
        if @company.save
            render json: @company 
        else
            render json: {error: "company not created"}
        end
    end

    def update
        @company = Company.find(params[:id])
        if @company.update(company_params)
            render json: @company 
        else
            render json: {error: " company not updated "}
        end
    end

    def destroy
        @company = Company.find(params[:id])
        if @company.destroy
            render json: {message: " company deleted "}
        else
            render json: {error: "company could not deleted"}
        end
    end

    private
    def company_params
        params.require(:company).permit(:name , :description)
    end
end
