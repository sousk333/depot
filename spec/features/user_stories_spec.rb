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
    fill_in "Email", with: order[:email]
    select "現金", from: "Pay type"
    save_screenshot sc_path("user_stories_1.png")

    click_button "注文する"
    expect(find("#notice")).to have_content "ご注文ありがとうございます"

    mail = ActionMailer::Base.deliveries.last
    expect(mail.to).to eq [order[:email]]
    save_screenshot sc_path("user_stories_2.png")
  end
end
