require 'rails_helper'

feature 'user can submit home form' do
  scenario 'user fills out forms and submits them' do
    user = User.create(name: 'steve', email: 'steven@trel.co', HTTP_AUTH_TOKEN: 'this_is_a_very_simple_auth_token_string')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    # Sets session address
    visit '/find'

    VCR.use_cassette('submit-home-passing') do
      fill_in :address, with: '1860_south_marion_street-Denver-CO-80210'
      click_on 'Find Location'
    end

    visit collect_path

    expect(page).to have_content('Begin The Listing Consultation')
    click_on 'Start'
    fill_in :about_the_home, with: 'A home'
    fill_in :recommended_list_price, with: '100000'
    fill_in :update_client_enthusiasm, with: 'Stoked'
    fill_in :buyer_agent_commission, with: '500'
    fill_in :about_the_seller, with: 'Excited'
    fill_in :credit_card_number, with: '347881974288396'
    select '10', from: 'date[credit_card_expiration_month]'
    select '2018', from: 'date[credit_card_expiration_year]'
    VCR.use_cassette('submit-home-finish-passing') do
      click_on 'Finish'
    end
    # save_and_open_page
    # expect(current_path).to eq(collect_path)
    # expect(page).to have_content("Listing Consultation Complete")
    # click_on "Dismiss"
    # expect(page).to have_button('Finish', disabled: true)
  end
  scenario 'user fills out wrong form information' do
    user = User.create(name: 'steve', email: 'steven@trel.co', HTTP_AUTH_TOKEN: 'this_is_a_very_simple_auth_token_string')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    # Sets session address
    visit '/find'

    VCR.use_cassette('submit-home-failing') do
      fill_in :address, with: '1860_south_marion_street-Denver-CO-80210'
      click_on 'Find Location'
    end

    visit collect_path
    expect(page).to have_content('Begin The Listing Consultation')
    click_on 'Start'
    fill_in :about_the_home, with: 'A home'
    fill_in :recommended_list_price, with: '100000'
    fill_in :update_client_enthusiasm, with: 'Stoked'
    fill_in :buyer_agent_commission, with: '500'
    fill_in :about_the_seller, with: 'Hot'
    fill_in :credit_card_number, with: '3478396'
    select '10', from: 'date[credit_card_expiration_month]'
    select '2018', from: 'date[credit_card_expiration_year]'
    VCR.use_cassette('submit-home-finish-failing') do
      click_on 'Finish'
    end
<<<<<<< HEAD

    expect(page).to have_content("Invalid form data.")
=======
    expect(page).to have_content("Something went wrong while posting the form, please try again.")
>>>>>>> 82aef273d5ecd7571e9cc580ee28b0b9ab1d2537
  end
end
