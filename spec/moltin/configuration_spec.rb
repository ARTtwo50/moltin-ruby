require 'spec_helper'

describe 'configuration' do
 
  Moltin::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe ".#{key}" do
      it 'should return the default value' do
        expect(Moltin.send(key)).to eq(Moltin::Configuration.const_get("DEFAULT_#{key.upcase}"))
      end
    end
  end

  after do
    Moltin.reset
  end

  describe '.configure' do
    Moltin::Configuration::VALID_CONFIG_KEYS.each do |key|
      it "should set the #{key}" do
        Moltin.configure do |config|
          config.send("#{key}=", key)
          expect(Moltin.send(key)).to eq(key)
        end
      end
    end
  end
 
end