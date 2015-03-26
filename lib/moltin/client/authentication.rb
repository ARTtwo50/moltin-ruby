module Moltin
  class Client
    module Authentication
      def authenticate
        response = post("oauth/access_token", auth_params)
        puts response
        raise TargetError if response["access_token"].nil?
        @access_token = response["access_token"]
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