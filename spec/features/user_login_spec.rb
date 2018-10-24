require 'rails_helper'

feature 'User logs in' do
  scenario 'via /login' do
    visit '/login'

    fill_in :user_email, with: "steven@trel.co"
    fill_in :user_password, with: "password"
    click_on "Login"

    expect(current_path).to eq("/address")
  end
end
