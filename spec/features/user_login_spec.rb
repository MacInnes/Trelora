require 'rails_helper'

feature 'User logs in' do
  scenario 'as a new user' do

    visit '/'

    fill_in :email, with: "steven@trel.co"
    fill_in :password, with: "password"
    click_on "Login"

    expect(current_path).to eq("/address")
  end
  scenario 'as an existing user' do
    user = User.create(name: "steve", email: "steven@trel.co", HTTP_AUTH_TOKEN: "this_is_a_very_simple_auth_token_string")
    visit '/'

    fill_in :email, with: user.email
    fill_in :password, with: "password"
    click_on "Login"

    expect(current_path).to eq("/address")
  end
  scenario 'as an invalid user' do
    visit '/'

    fill_in :email, with: "asdf@asdf.com"
    fill_in :password, with: "password"
    click_on "Login"

    expect(current_path).to eq("/")
    expect(page).to have_content("Invalid login information.")
  end
end
