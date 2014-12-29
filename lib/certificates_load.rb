module CertificateLoad
  def CertificateLoad.add_certificates
    Certificate.destroy_all
    require 'csv'
    csv_text = File.read('lib/photos/certificates/certificates.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      a = row.to_hash
      certificate = Certificate.new
      file_of_picture = File.open(a["picture"])
      certificate.asset = file_of_picture
      file_of_picture.close
      certificate.save!
    end
  end
end
