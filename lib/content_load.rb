module ContentLoad
  def ContentLoad.add_services
    Service.destroy_all
    require 'csv'
    csv_text = File.read('lib/photos/service.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      a = row.to_hash
      service = Service.new
      service.name = "#{a["name"]}"
      file_of_picture = File.open(a["picture"])
      service.picture = file_of_picture
      service.description = "#{a["description"]}"
      service.description.gsub!("\n","<br>")
      file_of_picture.close
      service.save!
    end
  end
end

