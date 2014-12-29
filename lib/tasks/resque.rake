require 'resque/tasks'
# the rest is automatic. Add more here if needed
task "resque:setup" => :environment do
  ENV['QUEUE'] ||= '*'
  ENV['RESQUE'] = "true" unless ENV["ENABLE_RESQUE"]
  Resque.before_fork = Proc.new { ActiveRecord::Base.establish_connection }
end
