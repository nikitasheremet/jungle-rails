require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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
  scenario "They click on a product" do
    # ACT
    visit root_path
    first('footer').find('button.btn-primary').click
    sleep(5)

    # DEBUG / VERIFY
    save_screenshot
    # expect(page).to have_css 'article.product', count: 10
  end
end
