module PartnersLoad
  def PartnersLoad.add_partners
    Partner.destroy_all
    require 'csv'
    csv_text = File.read('lib/photos/partners/partners.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      a = row.to_hash
      partner = Partner.new
      partner.name = "#{a["name"]}"
      partner.description = "#{a["description"]}"
      partner.description.gsub!("\n","<br>")
      partner.email = "#{a["email"]}"
      file_of_picture = File.open(a["picture"])
      partner.picture = file_of_picture
      file_of_picture.close
      partner.save!
    end
  end
end