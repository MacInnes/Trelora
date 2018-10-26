require 'rails_helper'

feature 'user can submit home form' do
  scenario 'user fills out forms and submits them' do
    user = User.create(name: "steve", email: "steven@trel.co", HTTP_AUTH_TOKEN: "this_is_a_very_simple_auth_token_string")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/collect'
    expect(page).to have_content('Begin The Listing Consultation')
    click_on 'Start'
    fill_in :about_the_home, with: "A home"
    fill_in :recommended_list_price, with: 100000
    fill_in :update_client_enthusiasm, with: "Stoked"
    fill_in :buyer_agent_commission, with: 500
    fill_in :about_the_seller, with: "Total dick"
    fill_in :credit_card_number, with: 1234567891234567890
    fill_in :credit_card_expiration_date, with: "2020-09-15"
    click_on "Finish"
  end
end
# As an authenticated user,
# after revealing the forms,
# I see a form for About the Home,
# Recommended List Price,
# Update Client Enthusiasm,
# Buyer Agent Commission,
# About the Seller,
# Credit Card Number,
# Credit card expiration date.
# There is a Finish button below the forms.
