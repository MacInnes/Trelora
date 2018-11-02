require 'rails_helper'

describe 'a visitor' do
  it 'tries to visit /find' do
    visit '/'
    visit '/find'

    expect(current_path).to eq('/')
    expect(page).to have_content('Please log in to access more content')
  end
end
