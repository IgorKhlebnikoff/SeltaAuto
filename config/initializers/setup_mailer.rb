ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'selta-auto.com.ua',
  user_name: 'seltaauto.service@gmail.com',
  password: 'the_perfect.service',
  authentication: 'plain',
  enable_starttls_auto: true
}
