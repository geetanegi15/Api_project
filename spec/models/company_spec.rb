require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'validation tests' do
    it 'ensure company name present' do
      company = Company.new(description: " testing the rspec " , image: "" , video: "" ).save
      expect(company).to eq(false)
    end

    it 'ensure company description present' do
      company = Company.new(name: " rspec" , image: "" , video: "" ).save 
      expect(company).to eq(false)
    end

    it 'should saved successfully' do
      company = Company.new(name: " rspec" ,description: " testing the rspec " , image: "" , video: "" ).save
      expect(company).to eq(true)
    end
    
  end
end
