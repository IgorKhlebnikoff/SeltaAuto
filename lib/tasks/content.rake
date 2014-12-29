# encoding: UTF-8
namespace :db do
  desc 'create Content data'
  task populate_contents: :environment do


    Content.where(name: "Ремонт двигателя", description: "<p><font face=\"verdana,geneva\">Ремонт двигателяэто ...", picture_file_name: "DSCN3509.JPG", picture_content_type: "image/jpeg", picture_file_size: 2001790, picture_updated_at: "2014-07-01 20:18:22", user_id: nil, type: "Service", category_id: nil).first_or_create
    Content.where(name: "Ремонт топливной системы", description: "<p><font face=\"verdana,geneva\">Поломки и неисправно...", picture_file_name: "Topl1.png", picture_content_type: "image/png", picture_file_size: 32511, picture_updated_at: "2014-06-28 14:23:57", user_id: nil, type: "Service", category_id: nil).first_or_create
    Content.where(name: "Ремонт ходовой", description: "<p><font face=\"verdana,geneva\">Ходовая часть автомо...", picture_file_name: "lib/photos/1343046841_hodovaja.png", picture_content_type: "image/png", picture_file_size: 34511, picture_updated_at: "2014-06-28 14:22:40", user_id: nil, type: "Service", category_id: nil).first_or_create
    Content.where(name: "Ремонт тормозной системы", description: "<p><font face=\"verdana,geneva\">Так кактормозная сис...", picture_file_name: "trmsistem.png", picture_content_type: "image/png", picture_file_size: 53793, picture_updated_at: "2014-06-28 14:24:50", user_id: nil, type: "Service", category_id: nil).first_or_create
    Content.where(name: "Ремонт электроники / услуги автоэлектрика", description: "<p>Автоэлектрика  нервная система вашего автомобиля...", picture_file_name: "Topl1.png", picture_content_type: "image/png", picture_file_size: 32511, picture_updated_at: "2014-06-29 08:22:02", user_id: nil, type: "Service", category_id: nil).first_or_create

  end
end
