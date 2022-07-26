require "strategies/nftauth"
Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = '/auth'
    config.allowed_request_methods = %i[post get]
  end
  provider :developer
  provider :nftauth, client_id: ENV['client_id'],
    client_secret: ENV['client_secret'],
    scope: 'read'
end
