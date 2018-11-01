require 'rails_helper'

describe "AddressFacade" do

  before :each do
    @address_facade = AddressFacade.new("1860_south_marion_street-Denver-CO-80210", "this_is_a_very_simple_auth_token_string")
  end

  describe 'methods' do
    it 'tests address facade methods' do
      VCR.use_cassette('address-facade-passing') do
        expect(@address_facade.client_name).to eq("Tyler Long")
        expect(@address_facade.client_email).to eq("tyler+12@trelora.com")
        expect(@address_facade.client_phone).to eq("3033333333")
        expect(@address_facade.opted_in?).to eq(true)
        expect(@address_facade.found_us).to eq("Google Search")
        expect(@address_facade.enthusiasm).to eq("Interested in Moving Forward")
        expect(@address_facade.timing).to eq("Less than 2 Months")
        expect(@address_facade.adopter_type).to eq("Early Adopter")
        expect(@address_facade.stage).to eq("Just getting interested in prepping home for sale. Wants to sell and use $$ to buy with us as well.")
        expect(@address_facade.zestimate).to eq(704000)
        expect(@address_facade.zillow_low).to eq(696000)
        expect(@address_facade.zillow_high).to eq(754000)
        expect(@address_facade.home_junction_low).to eq(578000)
        expect(@address_facade.home_junction_high).to eq(679000)
        expect(@address_facade.regional_average).to eq(689000)
        expect(@address_facade.exterior_updates).to eq( "New Roof in 07/15")
        expect(@address_facade.interior_updates).to eq("Basement Updated and Finished 8/2016")
        expect(@address_facade.is_invalid?).to eq(false)
      end
    end
  end
end
