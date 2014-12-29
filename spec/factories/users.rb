FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
  factory :worker, class: User do
    email                 { Faker::Internet.email }
    password              'password'
    password_confirmation 'password'
    role_id               { Role.find_or_create_by_name('Worker').id }
  end

  factory :admin, parent: :worker do
    role_id               { Role.find_or_create_by_name('Admin').id }
  end
end
