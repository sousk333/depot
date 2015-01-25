require 'rails_helper'

feature "User Stories" do
  background do
    @book = create(:product)
  end

  scenario "buying a product", js: true do
    visit store_path
    click_button "Add to Cart"
    sleep 2
    click_button "Checkout"

    order = attributes_for(:order)
    fill_in "Name", with: order[:name]
    fill_in "Address", with: order[:address]
    fill_in "E-mail", with: order[:email]
    select "現金", from: "Pay Type"
    save_screenshot sc_path("user_stories_1.png")

    click_button "Place Order"
    expect(find("#notice")).to have_content "Thank you for your order"

    mail = ActionMailer::Base.deliveries.last
    expect(mail.to).to eq [order[:email]]
    save_screenshot sc_path("user_stories_2.png")
  end
end
