require 'rails_helper'

feature 'user can find an address' do
  scenario 'user visits pricing location address screen and searches for an address' do
    user = User.create(name: "Dylan", email: "email", HTTP_AUTH_TOKEN: "this_is_a_very_simple_auth_token_string")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette('address-show-passing') do
      visit '/find'
      fill_in :address, with: "1860_south_marion_street-Denver-CO-80210"
      click_on "Find Location"
      expect(current_path).to eq(address_path)
    end
  end
  scenario 'user enters an invalid address' do
    user = User.create(name: "Dylan", email: "email", HTTP_AUTH_TOKEN: "this_is_a_very_simple_auth_token_string")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette('address-show-failing') do
      visit '/find'
      fill_in :address, with: "not a real address"
      click_on "Find Location"
      expect(page).to have_content("Address Not Found")
      expect(current_path).to eq('/find')
    end
  end
end
