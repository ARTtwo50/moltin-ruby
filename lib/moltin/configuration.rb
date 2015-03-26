module Moltin
  module Configuration
    VALID_CONNECTION_KEYS = [:endpoint, :user_agent, :method].freeze
    VALID_OPTIONS_KEYS    = [:client_id, :client_secret, :format].freeze
    VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS
 
    DEFAULT_ENDPOINT    = 'https://api.molt.in'
    DEFAULT_METHOD      = :get
    DEFAULT_USER_AGENT  = "Moltin API Ruby Gem #{Moltin::VERSION}".freeze
 
    DEFAULT_CLIENT_ID    = nil
    DEFAULT_CLIENT_SECRET   = nil
    DEFAULT_FORMAT       = :json
 
    # Build accessor methods for every config options so we can do this, for example:
    #   Awesome.format = :xml
    attr_accessor *VALID_CONFIG_KEYS
 
    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end
 
    def reset
      self.endpoint   = DEFAULT_ENDPOINT
      self.method     = DEFAULT_METHOD
      self.user_agent = DEFAULT_USER_AGENT
 
      self.client_id  = DEFAULT_CLIENT_ID
      self.client_secret = DEFAULT_CLIENT_SECRET
      self.format     = DEFAULT_FORMAT
    end

    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

    def configure
      yield self
    end
 
  end # Configuration
end