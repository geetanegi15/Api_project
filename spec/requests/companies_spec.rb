require 'rails_helper'

RSpec.describe "Companies", type: :request do
  context "GET /index" do
    it 'return a success response for index 1' do
      get "/companies"
      expect(response.status).to eq(200)
    end
  end

  context "GET /show" do
    it 'return a success response for show' do
      @company = Company.create!(name: "Planetspark" , description: "it's a ed-tech company")
      get "/companies/#{@company.id}", params: {id: @company.to_param}
      expect(response).to be_success
    end
  end

  context 'POST /create' do
    it 'valid company attributes ' do
      post "/companies" , params: {
        company: {
          name: 'testing rspec create',
          description: 'testing rspec',
          image: "",
          video: ""
        }
      }
      expect(response).to have_http_status(201)
    end
    it 'Invalid company attributes ' do
      post "/companies", params: {
        company: {
          name: '',
          description: 'testing rspec',
          image: "",
          video: ""
        }
      }
      expect(response).to be_success
    end
  end

  context 'PUT /update' do
    it 'update the data ' do
      @company = Company.create!(name: "Planetspark" , description: "it's a ed-tech company")
      put "/companies/#{@company.id}" ,params:{ id: @company.id , company: {name: "xyz" , description: "abc" } }
      expect(response).to have_http_status(200)
    end

    it 'does not update the data ' do
      @company = Company.create!(name: "test case" , description: "test case for not update fun ")
      put "/companies/#{@company.id}" ,params:{ id: @company.id , company: {name: "" , description: "" } }
      expect(response).to have_http_status(401)
    end
  
    context 'DELETE /destroy' do
      it 'delete the record' do
        @company = Company.create!(name: "Planetspark" , description: "it's a ed-tech company")
        delete "/companies/#{@company.id}" ,params:{ id: @company.id }
        expect(response).to have_http_status(200)
      end

      it ' does not delete the record' do
        @company = Company.create!(name: "Planetspark" , description: "it's a ed-tech company")
        delete "/companies/#{@company.id}" ,params:{ id: " " }
        expect(response).to have_http_status(200)
      end
    end
  
  end

end