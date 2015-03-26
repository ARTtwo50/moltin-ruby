require 'spec_helper'

describe 'client' do
    
  it "should set config keys on initialize " do
    m = Moltin::Client.new
    Moltin::Configuration::VALID_CONFIG_KEYS.each do |key|
      expect(Moltin.send(key)).to eq(Moltin::Configuration.const_get("DEFAULT_#{key.upcase}"))
    end
  end 

  it "should set config keys on initialize " do
    m = Moltin::Client.new({client_id: 'my_client_id'})
    Moltin::Configuration::VALID_CONFIG_KEYS.each do |key|
      if key.to_sym == :client_id
        m.client_id == 'my_client_id'
      else
        expect(m.send(key)).to eq(Moltin::Configuration.const_get("DEFAULT_#{key.upcase}"))
      end
    end
  end

  it "should receive an access token from authenticate" do
    stub_authenticate(:success, "VKub38hTn7IuqNjSI5pd5msulhaQ0TftiyyOUcls", "RPw4V4oZXlqUFKjZbMAoYhOxR7KuJ9fxFUXZgVcw")
    client = Moltin::Client.new({client_id: "VKub38hTn7IuqNjSI5pd5msulhaQ0TftiyyOUcls", client_secret: "RPw4V4oZXlqUFKjZbMAoYhOxR7KuJ9fxFUXZgVcw"})
    client.authenticate()
    expect(client.access_token).to_not be_nil
  end

  it "should forward client_id and client_secret" do
    Moltin.client_id = "myClientId1234"
    expect(Moltin.client_id).to eq("myClientId1234")
    Moltin.client_secret = "myClientSecret1234"
    expect(Moltin.client_secret).to eq("myClientSecret1234")
  end


end