require 'spec_helper'

feature 'Visitor sign up' do
  scenario 'with valid email and password' do
    sign_up_with 'fares', 'fares@gmail.com', '000000', '000000'
    expect(page).to have_content('All transaction')
  end

  scenario 'with valid email and password' do
    sign_up_with 'fares', 'fares@gmail.com', '000000', '000000'
    expect(page).to have_content('All groups')
  end

  scenario 'with valid email and password' do
    sign_up_with 'fares', 'fares@gmail.com', '000000', '000000'
    expect(page).to have_content('External transiction')
  end

  scenario 'with invalid email' do
    sign_up_with 'name', '', '000000', '000000'

    expect(page).to have_content('Sign up')
  end

  scenario 'with empty user' do
    sign_up_with '', 'fares@gmail.com', '000000', '000000'

    expect(page).to have_content('Sign up')
  end

  def sign_up_with(username, email, password, confirmation)
    visit new_user_registration_path
    fill_in 'Username', with: username
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: confirmation
    click_button 'Sign up'
  end
end
