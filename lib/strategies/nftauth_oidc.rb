module OmniAuth
  module Strategies
    class NftauthOidc < OmniAuth::Strategies::OpenIDConnect
      option :name, 'nftauth_oidc'

      option :scope, %i[openid eth_address nfts]
      option :response_type, 'code'
      option :issuer, "https://localhost:8443"
      option :discovery, true

      uid do
        user_info.sub
      end

      info do
        {
          name: user_info.name,
          email: user_info.email,
          nickname: user_info.preferred_username,
          first_name: user_info.given_name,
          last_name: user_info.family_name,
          gender: user_info.gender,
          image: user_info.picture,
          phone: user_info.phone_number,
          urls: { website: user_info.website },
        }
      end
    end
  end
end
