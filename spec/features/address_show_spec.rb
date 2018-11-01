require 'rails_helper'

describe 'address show page' do
  it 'displays address breakdown' do
    user = User.create(name: 'Maria',
                       email: 'email@email.com',
                       HTTP_AUTH_TOKEN: 'this_is_a_very_simple_auth_token_string')
    addresses = [Address.new('1860_south_marion_street-Denver-CO-80210'),
                 Address.new('910-portland_place-Boulder-CO-80304')]
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:find_addresses).and_return(addresses)

    VCR.use_cassette('address-show-page') do
      visit '/find'
      select '1860 South Marion Street Denver Co 80210', from: :address
      click_on 'Find Location'
    end

    expect(current_path).to eq(address_path)

    VCR.use_cassette('address-show-page') do
      address = '1860_south_marion_street-Denver-CO-80210'
      token = 'this_is_a_very_simple_auth_token_string'
      address_facade = AddressFacade.new(address, token)

      expect(page).to have_content(address_facade.client_name)
      expect(page).to have_content(address_facade.client_email)
      expect(page).to have_content(address_facade.opted_in)
      expect(page).to have_content(address_facade.client_phone)
      expect(page).to have_content(address_facade.found_us)
      expect(page).to have_content(address_facade.enthusiasm)
      expect(page).to have_content(address_facade.timing)
      expect(page).to have_content(address_facade.stage)
      expect(page).to have_content('$704,000')
      expect(page).to have_content('$696,000')
      expect(page).to have_content('$754,000')
      expect(page).to have_content('$689,000')
      expect(page).to have_content('$578,000')
      expect(page).to have_content('$679,000')
      expect(page).to have_content(address_facade.adopter_type)
      expect(page).to have_content(address_facade.exterior_updates)
      expect(page).to have_content(address_facade.interior_updates)
    end
  end
end
