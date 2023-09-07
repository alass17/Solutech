require 'rails_helper'

RSpec.describe 'User management', type: :system do

  before do

    driven_by :rack_test

  end

  it 'creates a new user' do
    visit new_user_registration_path
    fill_in 'Nom', with: 'eeeeee'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Nouveauté')

  end

  it 'logs in an existing user' do
    user = User.create( email: 'test@example.com', password: 'password',password_confirmation:'password',nom:"didinn")
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "password"
    click_button 'Log in'
    expect(page).to have_content("Nouveauté")

  end

end