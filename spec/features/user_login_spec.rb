require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Iron',
      last_name: 'Man',
      email: 'iron@man.com',
      password: 'ironman',
      password_confirmation: 'ironman'
    )
  end

  scenario "They will log in" do
    # ACT
    visit root_path

    # Find log in link
    page.find_link('Log in').click

    # Verify the login page
    expect(page).to have_text('Email')

    page.find_by_id('email').set('iron@man.com')

    page.find_by_id('password').set('ironman')

    page.find_button('Log in').click

    expect(page).to have_text('Signed in as: Iron')

    save_screenshot('login.png')
  end
end