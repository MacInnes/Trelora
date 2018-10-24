require 'rails_helper'

feature 'user can find an address' do
  scenario 'user visits pricing location address screen and searches for an address' do

    visit '/find'
    fill_in :address, with: "1860_south_marion_street-Denver-CO-80210"
    click_on "Find Location"
    expect(current_path).to eq(address_path)
  end
end

# As an authenticated user,
# when i visit the pricing location address screen (slide 4),
# I see an input field titled 'Pricing Location Address',
# and below that a 'Find Location' button.
# As an authenticated user,
# when i visit the pricing location address screen,
# and fill out a VALID address and click find location,
# app calls to trelora transaction retrieval webservice POST "api/v0/turing/properties",
# responds with a 200 ok and takes user to address show page.