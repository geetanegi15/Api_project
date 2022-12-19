class EmployeesController < ApplicationController

    def index
        @company = Company.find(params[:company_id])
        @employees = @company.employees.all 
        render json: @employees
    end

    def create
        @company = Company.find(params[:company_id])
        @employee = @company.employees.create(employee_params)

        if @employee.save
            render json: @employee
        else
            render json: {error: " Employee Information is not recorded "}
        end
    end

    def show
        @company = Company.find(params[:company_id])
        @employee = @company.employees.find(params[:id])
        render json: @employee
    end

    def update
        @company = Company.find(params[:company_id])
        @employee = @company.employees.find(params[:id])
        
        if @employee.update(employee_params)
            render json: @employee
        else
            render json: {error: " Employee information could not updated"}
        end
    end

    def destroy
        @company = Company.find(params[:company_id])
        @employee = @company.employees.find(params[:id])

        if @employee.destroy
            render json: {message: " employee's imformation deleted"}
        else
            render json: {error: " employee's information could not deleted"}
        end
    end

    private
    def employee_params
        params.require(:employee).permit(:name , :role , :email)
    end
end
