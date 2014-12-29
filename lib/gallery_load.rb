module GalleryLoad
  def GalleryLoad.add_gallery
    Photo.where(type: nil).destroy_all
    require 'csv'
    csv_text = File.read('lib/photos/gallery/gallery.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      a = row.to_hash
      photo = Photo.new
      file_of_picture = File.open(a["picture"])
      photo.asset = file_of_picture
      file_of_picture.close
      photo.save!
    end
  end
end