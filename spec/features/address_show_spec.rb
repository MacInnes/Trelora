require 'rails_helper'

describe 'address show page' do
  before :each do
    @address_facade = AddressFacade.new("1860_south_marion_street-Denver-CO-80210", "this_is_a_very_simple_auth_token_string")
    json_response = File.open("./fixtures/address_response.json")
    stub_request(:get, "https://www.trylora.com/api/v0/turing/properties?address=1860_south_marion_street-Denver-CO-80210&HTTP_AUTH_TOKEN=this_is_a_very_simple_auth_token_string").
    to_return(status: 200, body: json_response)
  end

  it 'displays address breakdown' do
    user = User.create(name: "Maria", email: "email@email.com", HTTP_AUTH_TOKEN: "this_is_a_very_simple_auth_token_string")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/address'

    expect(page).to have_content(@address_facade.client_name)
    expect(page).to have_content(@address_facade.client_email)
    expect(page).to have_content("Opted in: Yes")
    expect(page).to have_content(@address_facade.client_phone)
    expect(page).to have_content(@address_facade.found_us)
    expect(page).to have_content(@address_facade.enthusiasm)
    expect(page).to have_content(@address_facade.timing)
    expect(page).to have_content(@address_facade.stage)
    expect(page).to have_content(@address_facade.zillow_low)
    expect(page).to have_content(@address_facade.zillow_high)
    expect(page).to have_content(@address_facade.zestimate)
    expect(page).to have_content(@address_facade.regional_average)
    expect(page).to have_content(@address_facade.home_junction_low)
    expect(page).to have_content(@address_facade.home_junction_high)
    expect(page).to have_content(@address_facade.adopter_type)
    expect(page).to have_content(@address_facade.updates)
    #expect(page).to have_content(@address_facade.retainer)



#     As an authenticated user,
# on the address show page,
# there is a breakdown of all data collected from the response including
# client name, email, phone number, map (coordinates), opted in, found us, estimate (pricing_estimates), enthusiasm, timing, adopter_type, updates, stage, retainer
# from the Find Location webservice (slide 6).
  end
end
