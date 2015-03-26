module Moltin
  class Client
    module Connection
      private

      def connection
        conn = Faraday.new(:url => Moltin::Configuration::DEFAULT_ENDPOINT) do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          faraday.response :json, :content_type => /\bjson$/
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end
  end
end