require 'faraday'
require 'faraday_middleware'
require 'moltin/client/authentication'
require 'moltin/client/connection'
require 'moltin/client/errors'
require 'moltin/client/request'

module Moltin
  class Client
 
    # Define the same set of accessors as the Awesome module
    attr_accessor *Configuration::VALID_CONFIG_KEYS
    attr_reader :access_token


    def initialize(options={})
      # Merge the config values from the module and those passed
      # to the client.
      merged_options = Moltin.options.merge(options)
 
      # Copy the merged values to this client and ignore those
      # not part of our configuration
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
      @target_url = Moltin::Configuration::DEFAULT_ENDPOINT
      @version = Moltin::Configuration::DEFAULT_VERSION
    end

    include Authentication
    include Connection
    include Request
 
  end # Client
end