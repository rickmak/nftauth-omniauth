require "strategies/nftauth"
require "strategies/nftauth_oidc"
Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = '/auth'
    config.allowed_request_methods = %i[post get]
  end
  provider :developer
  provider :nftauth, client_id: ENV['client_id'],
    client_secret: ENV['client_secret'],
    scope: 'read'
  provider :nftauth_oidc,
    client_options: {
      identifier: ENV['client_id'],
      secret: ENV['client_secret'],
      redirect_uri: "http://localhost:3001/auth/nftauth_oidc/callback",
    }
end
