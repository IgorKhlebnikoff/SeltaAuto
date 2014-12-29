require 'certificates_load'
  namespace :admin do
    desc 'load pictures'
    task load_certificates: :environment do
      CertificateLoad.add_certificates
    end

  end