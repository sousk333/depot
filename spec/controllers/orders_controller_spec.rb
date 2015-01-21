require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'GET new' do
    it 'requires item in cart' do
      get :new
      expect(response).to redirect_to store_path
      expect(flash[:notice]).to eq 'カートは空です'
    end

    it 'should get new' do
      cart = create(:cart, line_items: create_list(:line_item, 3))
      get :new, {}, { cart_id: cart.id }
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    it 'should create order' do
      expect {
        post :create, order: attributes_for(:order)
      }.to change(Order, :count).by(1)
    end

    it 'redirects to store#index' do
      post :create, order: attributes_for(:order)
      expect(response).to redirect_to store_path
    end
  end
end
