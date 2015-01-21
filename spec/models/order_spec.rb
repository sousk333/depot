require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:email) }
    it {
      is_expected.to validate_inclusion_of(:pay_type)
        .in_array(Order::PAYMENT_TYPES)
    }
    it { is_expected.to have_many(:line_items).dependent(:destroy) }
  end

  describe "#add_line_items_from_cart" do
    before do
      @cart = create(:cart, line_items: create_list(:line_item, 3))
      @order = create(:order)
      @order.add_line_items_from_cart @cart
      @cart.reload
    end

    it { expect(@order.line_items.count).to eq 3 }
    it { expect(@cart.line_items.count).to eq 0 }
  end
end
