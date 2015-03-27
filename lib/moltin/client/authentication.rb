module Moltin
  class Client
    module Authentication
      def authenticate
        response = post("oauth/access_token", auth_params)
        if response["access_token"]
          @access_token = response["access_token"]
        else
          raise TargetError, "Error: #{response}"
        end
      end

      private

      def auth_params
        { 
          body: {
            :client_id => @client_id,
            :client_secret => @client_secret,
            :grant_type => "client_credentials"
          }
        }
      end
    end
  end
end