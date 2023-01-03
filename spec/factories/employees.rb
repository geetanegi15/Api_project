FactoryBot.define do
    factory :employee do
        name { Faker::Name.name }
        role { 'developer' }
        email { Faker::Internet.email }
        #company_id {1}
        company 
    end
end