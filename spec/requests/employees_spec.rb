require 'rails_helper'

RSpec.describe "Employees", type: :request do
  before (:each)do
    @company = create(:company)
    #byebug
    @employee = Employee.create!(name: "geeta negi" , email: "geeta.negi@gmail.com" ,  role: " Hr" , company_id: @company.id)
  end

  describe "GET /index" do
    it 'return a success response for index' do
      get "/companies/"+"#{@company.id}"+"/employees"
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it 'return a success response for show' do
      get "/companies/"+"#{@company.id}"+"/employees/#{@employee.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it 'create for valid attribute' do
      post "/companies/"+"#{@company.id}"+"/employees" , params: { employee: {
        "name": "hanshika" , 
        "role": "hr" ,
        "email": "priti26@gmail.com",
        "company_id": "13"
    }} 
      expect(response).to have_http_status(200)
    end

    it 'does not create for invalid attribute ' do
      post "/companies/"+"#{@company.id}"+"/employees" , params: { employee: {
        "name": "" , 
        "role": "hr" ,
        "email": "priti26@gmail.com",
        "company_id": "13"
    } }
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /destroy" do
    it 'delete the record' do
      delete "/companies/"+"#{@company.id}"+"/employees/#{@employee.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /update" do
     it 'update for valid attributes' do
      put "/companies/"+"#{@company.id}"+"/employees/#{@employee.id}" , params: {id: @employee.id ,employee: { 
      name: "rajat singh" , 
      role: " hr" , 
      email: "rajar.hr@gmail.com"
    }
    }
      expect(response).to have_http_status(200)
    end

    it ' does not update for invalid attributes ' do
      put "/companies/"+"#{@company.id}"+"/employees/#{@employee.id}" , params: {id: @employee.id ,employee: { 
        name: "" ,
        role: "" , 
        email: ""
         }
        }
      expect(response).to have_http_status(200)
    end
  end
end
