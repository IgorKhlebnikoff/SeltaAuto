# encoding: UTF-8
namespace :admin do
  desc 'create admin'
  task create: :environment do
    role = Role.find_by_name('Admin')
    if role
      if User.exists?(email: 'admin@selta-auto.com.ua')
        puts 'admin exists'
      else
        user = User.create!(email: 'admin@selta-auto.com.ua', password: 'password')
        role.users << user
        puts '--> admin created with admin@selta-auto.com.ua \ password'
      end
    else
      puts "Run 'rake db:seed' first"
    end
  end
end
