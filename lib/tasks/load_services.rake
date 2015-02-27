require 'content_load'
namespace :admin do
  desc 'load pictures'
  task load_services: :environment do
    ContentLoad.add_services
  end
end