FactoryGirl.define do
  factory :inspection_request do
    name   { Faker::Name.first_name }
    phone_number '+38-097-123-12-12'
    comment      { Faker::Lorem.sentence }
  end

  factory :viewed_inspection_request, parent: :inspection_request do
    viewed       true
    association  :viewed_by, factory: :user
  end
end
