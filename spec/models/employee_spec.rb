require 'rails_helper'

RSpec.describe Employee, type: :model do

  context 'validation test ' do
    let!(:company) {Company.create(name: "testing the rspec ", description: " testing the rspec " , image: "" , video: "" )}
    let!(:employee) {Employee.create!(name: "geeta negi" , role: "Analyst" , email: "geetanegi9876@gmail.com" , company: company)}
    
    it 'Employee record is valid ' do
      company = Company.create(name: "testing the rspec ", description: " testing the rspec " , image: "" , video: "" )
      employee = Employee.create!(name: "geeta negi" , role: "Analyst" , email: "geetanegi9876@gmail.com" , company_id: company.id)
      expect(employee).to be_valid
    end

    it 'employee record is not valid without name ' do
      employee = Employee.new(name: nil)
      expect(employee).to_not be_valid
    end

    it 'employee record is not valid without role ' do
      employee = Employee.new(role: nil)
      expect(employee).to_not be_valid
    end

    it 'employee record is not valid without email ' do
      employee = Employee.new(email: nil)
      expect(employee).to_not be_valid
    end

  end
end
