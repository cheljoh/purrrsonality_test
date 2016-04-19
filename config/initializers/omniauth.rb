OmniAuth.confi.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provide :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"]
end
