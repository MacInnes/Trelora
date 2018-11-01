require 'rails_helper'

feature 'user can find an address' do
  scenario 'user visits pricing location address screen and searches for an address' do
    user = User.create(name: "Dylan", email: "email", HTTP_AUTH_TOKEN: "this_is_a_very_simple_auth_token_string")
    addresses = [Address.new('1860_south_marion_street-Denver-CO-80210'), Address.new('910-portland_place-Boulder-CO-80304')]
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:find_addresses).and_return(addresses)

    VCR.use_cassette('address-show-passing') do
      visit '/find'
      select "1860 South Marion Street Denver Co 80210", from: :address
      click_on "Find Location"
      expect(current_path).to eq(address_path)
    end
  end
end
