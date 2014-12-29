FactoryGirl.define do
  factory :answer do
    body         'answer of question'
    association  :user
    association  :question

  end

end