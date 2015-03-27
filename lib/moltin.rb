require 'moltin/version'
require 'moltin/configuration'
require 'moltin/client'
require 'moltin/product'

module Moltin
  extend Configuration
  extend SingleForwardable

  def_delegators :client
  def_single_delegators [:client_id, :client_secret] => :client

  class << self
    def client
      @client ||= Moltin::Client.new({client_id: @client_id, client_secret: @client_secret})
    end
  end
end
