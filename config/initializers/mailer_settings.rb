ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true

ActionMailer::Base.smtp_settings = {
  address: ENV['EMAIL_ADRS'],
  port: "587",
  domain: ENV['EMAIL_DOMAIN'],
  user_name: ENV['EMAIL_UNME'],
  password: ENV['EMAIL_PW'],
  authentication: 'plain',
  enable_starttls_auto: true
}
