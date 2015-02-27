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
      csv_text_certificate = File.read("lib/photos/certificates/#{a["name"]}.csv")
      csv_certificate = CSV.parse(csv_text_certificate, :headers => true)
      csv_certificate.each do |roww|
        b = roww.to_hash
        certificate = Certificate.new
        file_of_certificate_picture = File.open(b["picture"])
        certificate.asset = file_of_certificate_picture
        file_of_certificate_picture.close
        certificate.partner_id = partner.id
        certificate.save!
      end
    end
  end
end