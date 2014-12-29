FactoryGirl.define do
  factory :news do
    name          "such name"
    description   "some description"
    association   :user
  end

end
