require 'spec_helper'

RSpec.describe AddressFacade do
  
  before :each do
    json_response = File.open("./fixtures/address_response.json")
    stub_request(:get, "https://www.trylora.com/api/v0/turing/properties?address=1860_south_marion_street-Denver-CO-80210&HTTP_AUTH_TOKEN=this_is_a_very_simple_auth_token_string").
    to_return(status: 200, body: json_response)
  end

  describe 'methods' do
    it '#client_name' do
    end
  end
end
