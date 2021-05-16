require 'rails_helper'

feature 'Visitor Sign In Page' do
  scenario 'Sigin in with wrong email and password' do
    sign_in_with '', ''
    expect(page).to have_content('Log in')
  end
  scenario 'Sigin in with out password' do
    sign_in_with 'fares@gamil.com', ''
    expect(page).to have_content('Log in')
  end
  scenario 'Sigin in with out email' do
    sign_in_with '', '000000'
    expect(page).to have_content('Log in')
  end

  def sign_in_with(login, password)
    visit new_user_session_path
    fill_in 'Login', with: login
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
