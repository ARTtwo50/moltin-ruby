require 'moltin/version'
require 'moltin/configuration'
require 'moltin/client'

module Moltin
  # Your code goes here...
  extend Configuration
  extend SingleForwardable

  def_delegators :client
  def_single_delegators [:client_id, :client_secret] => :client

  class << self
    def client
      @client ||= Moltin::Client.new()
    end
  end
end
