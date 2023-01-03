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
            CreateEmployeeNotificationMailer.create_notification(@employee).deliver_now
            render json: @employee , :status => 200
        else
            render json: {error: " Employee Information is not recorded "} , status: :unprocessable_entity
        end
    end

    def show
        @company = Company.find(params[:company_id])
        @employee = @company.employees.find(params[:id])
        render json: @employee ,:status => 200
    end

    def update
        @company = Company.find(params[:company_id])
        @employee = @company.employees.find(params[:id])
        
        if @employee.update(employee_params)
            render json: @employee , :status => 200
        else
            render json: {error: " Employee information could not updated" , status: 422} 
        end
    end

    def destroy
        @company = Company.find(params[:company_id])
        @employee = @company.employees.find(params[:id])

        if @employee.destroy
            render json: {message: " employee's imformation deleted"} , status: 200
        else
            render json: {error: " employee's information could not deleted"}
        end
    end

   
    private
    def employee_params
        params.require(:employee).permit(:name , :role , :email )
    end

   
end
