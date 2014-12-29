FactoryGirl.define do
  factory :comment do
    body          "some text"
    association   :news
    association   :user
  end

end