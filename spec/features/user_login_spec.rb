require 'rails_helper'

feature 'User logs in' do
  scenario 'via /login' do
    visit '/login'

    fill_in :email, with: "steven@trel.co"
    fill_in :password, with: "password"
    click_on "Login"

    expect(current_path).to eq("/address")
  end
end
