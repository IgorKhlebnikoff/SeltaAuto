# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Seltaauto::Application.initialize!

Dir["#{Rails.root}/lib/custom_extensions/*.rb"].each { |file| require file }
