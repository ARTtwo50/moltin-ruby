module Moltin
  class Client
    module Request

      def post(path, options={})
        request(:post, path, options)
      end

      def get(path, options={})
        request(:get, path, options)
      end

      private

      def request(action, path, options)
        response = connection.send(action, path) do |request|
          request.body = options[:body] if options[:body]
        end
        response.body 
      end

    end
  end

end