FactoryGirl.define do
  factory :question do
    title         'question'
    body          'Question body'
    association   :user
    association   :category
  end

end