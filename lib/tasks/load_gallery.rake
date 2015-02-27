require 'gallery_load'
namespace :admin do
  desc 'load pictures'
  task load_gallery: :environment do
    GalleryLoad.add_gallery
  end
end