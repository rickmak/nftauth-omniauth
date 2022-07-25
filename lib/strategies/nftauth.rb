module OmniAuth
  module Strategies
    class Nftauth < OmniAuth::Strategies::OAuth2
      option :name, "nftauth"

      option :client_options, {
        :site => "http://localhost:3000"
      }

      uid { raw_info["id"] }

      info do
        {
          email: raw_info["email"]
        }
      end

      extra do
        {
          "raw_info": raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/me").parsed
        p @raw_info
      end
    end
  end
end
