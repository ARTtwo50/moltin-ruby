module Moltin
  class Client
    module Authentication
      def authenticate
        response = post("oauth/access_token", auth_params)
        if response.status
          @access_token = response["access_token"]
        else
          raise TargetError, "Error: #{response}"
        end
      end

      private

      def auth_params
        {
          :client_id => "VKub38hTn7IuqNjSI5pd5msulhaQ0TftiyyOUcls",
          :client_secret => "RPw4V4oZXlqUFKjZbMAoYhOxR7KuJ9fxFUXZgVcw",
          :grant_type => "client_credentials"
        }
      end
    end
  end
end