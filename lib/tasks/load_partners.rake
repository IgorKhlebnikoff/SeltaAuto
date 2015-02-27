require 'partners_load'
namespace :admin do
  desc 'load partners'
  task load_partners: :environment do
    PartnersLoad.add_partners
  end
end