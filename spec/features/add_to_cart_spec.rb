require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot('homepage.png')

    # VERIFY
    expect(page).to have_css 'article.product', count: 10

    # Find first product and click add to cart
    page.find('article.product', match: :first).find_button('Add').click

    # Verify that cart has been updated
    expect(page).to have_text('My Cart (1)')

    save_screenshot('add_to_cart.png')
  end
end