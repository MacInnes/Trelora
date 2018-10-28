require 'rails_helper'

describe 'address show page' do

  it 'displays address breakdown' do
    user = User.create(name: "Maria", email: "email@email.com", HTTP_AUTH_TOKEN: "this_is_a_very_simple_auth_token_string")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    json_response = File.read("./fixtures/address_response.json")
    stub_request(:get, "https://www.trylora.com/api/v0/turing/properties?address=1860_south_marion_street-Denver-CO-80210&HTTP_AUTH_TOKEN=this_is_a_very_simple_auth_token_string").
    to_return(status: 200, body: json_response)

    visit '/find'
    fill_in :address, with: "1860_south_marion_street-Denver-CO-80210"
    click_on "Find Location"

    expect(current_path).to eq(address_path)
    address_facade = AddressFacade.new("1860_south_marion_street-Denver-CO-80210", "this_is_a_very_simple_auth_token_string")

    expect(page).to have_content(address_facade.client_name)
    expect(page).to have_content(address_facade.client_email)
    expect(page).to have_content(address_facade.opted_in?)
    expect(page).to have_content(address_facade.client_phone)
    expect(page).to have_content(address_facade.found_us)
    expect(page).to have_content(address_facade.enthusiasm)
    expect(page).to have_content(address_facade.timing)
    expect(page).to have_content(address_facade.stage)
    expect(page).to have_content(address_facade.zillow_low)
    expect(page).to have_content(address_facade.zillow_high)
    expect(page).to have_content(address_facade.zestimate)
    expect(page).to have_content(address_facade.regional_average)
    expect(page).to have_content(address_facade.home_junction_low)
    expect(page).to have_content(address_facade.home_junction_high)
    expect(page).to have_content(address_facade.adopter_type)
    expect(page).to have_content(address_facade.exterior_updates)
    expect(page).to have_content(address_facade.interior_updates)
    # expect(page).to have_content(address_facade.retainer)
  end
end
