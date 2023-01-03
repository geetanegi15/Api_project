FactoryBot.define do
    factory :company do
        name { Faker::Name.name }
        description { 'testing the rspec '}
        image { }
        video { } 
    end
end