module Moltin
  class Client
    module Authentication
      def authenticate
        response = post("oauth/access_token", auth_params)
        raise TargetError if response["access_token"].nil?
        @access_token = response["access_token"]
      end

      private

      def auth_params
        {
          :client_id => @client_id,
          :client_secret => @client_secret,
          :grant_type => "client_credentials"
        }
      end
    end
  end
end