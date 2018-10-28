require 'spec_helper'

RSpec.describe AddressFacade do

  before :each do
    @address_facade = AddressFacade.new("1860_south_marion_street-Denver-CO-80210", "this_is_a_very_simple_auth_token_string")
    json_response = File.open("./fixtures/address_response.json")
    stub_request(:get, "https://www.trylora.com/api/v0/turing/properties?address=1860_south_marion_street-Denver-CO-80210&HTTP_AUTH_TOKEN=this_is_a_very_simple_auth_token_string").
    to_return(status: 200, body: json_response)
  end

  describe 'methods' do
    it '#client_name' do
      expect(@address_facade.client_name).to eq("Tyler Long")
    end
    it '#client_email' do
      expect(@address_facade.client_email).to eq("tyler+12@trelora.com")
    end
    it '#client_phone' do
      expect(@address_facade.client_phone).to eq("3033333333")
    end
    it '#opted_in?' do
      expect(@address_facade.opted_in?).to eq(true)
    end
    it '#found_us' do
      expect(@address_facade.found_us).to eq("Google Search")
    end
    it '#enthusiasm' do
      expect(@address_facade.enthusiasm).to eq("Interested in Moving Forward")
    end
    it '#timing' do
      expect(@address_facade.timing).to eq("Less than 2 Months")
    end
    it '#adopter_type' do
      expect(@address_facade.adopter_type).to eq("Early Adopter")
    end
    it '#stage' do
      expect(@address_facade.stage).to eq("Just getting interested in prepping home for sale. Wants to sell and use $$ to buy with us as well.")
    end
    it '#zestimate' do
      expect(@address_facade.zestimate).to eq(704000)
    end
    it '#zillow_low' do
      expect(@address_facade.zillow_low).to eq(696000)
    end
    it '#zillow_high' do
      expect(@address_facade.zillow_high).to eq(754000)
    end
    it '#home_junction_low' do
      expect(@address_facade.home_junction_low).to eq(578000)
    end
    it '#home_junction_high' do
      expect(@address_facade.home_junction_high).to eq(679000)
    end
    it '#regional_average' do
      expect(@address_facade.regional_average).to eq(689000)
    end
    it '#updates' do
      expect(@address_facade.exterior_updates).to eq( "New Roof in 07/15")
      expect(@address_facade.interior_updates).to eq("Basement Updated and Finished 8/2016")
    end
    it '#is_invalid?' do
      expect(@address_facade.is_invalid?).to eq(false)
    end
  end
end
