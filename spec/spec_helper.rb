# test/helper.rb
require 'moltin'
require 'json'
# require 'minitest/spec'
# require 'minitest/autorun'
require 'rspec'
require 'webmock/rspec'


def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def stub_authenticate(status, client_id, client_secret)
  # fixture_file = status == :success ? "authenticate_success.txt" : "authenticate_fail.txt"
  # stub_request(:post, "https://api.molt.in/oauth/access_token").
  #         with(:body => {:client_id => 'client_id', 
  #                        :client_secret => 'client_secret',
  #                        :grant_type => 'client_credentials'}).
  #         to_return(fixture(fixture_file))
  # stub_request(:post, "https://api.molt.in/oauth/access_token").
  #        with(:body => {"client_id"=> client_id, "client_secret"=> client_secret, "grant_type"=>"client_credentials"},
  #             :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Length' => 0, 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Faraday v0.9.1'}).
  #        to_return(:status => status, :body => {"access_token" => 1123}.to_json, :headers => {})
  stub_request(:post, "https://api.molt.in/oauth/access_token").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Length'=>'0', 'User-Agent'=>'Faraday v0.9.1'}).
         to_return(:status => 200, :body => {"access_token" => 1123}.to_json, :headers => {})
end
