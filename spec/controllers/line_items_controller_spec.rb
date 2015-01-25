require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  before do
    login_as create(:user)
  end

  describe 'POST create' do
    let(:product) { create(:product) }

    it 'LineItem が登録されること' do
      expect {
        post :create, product_id: product
      }.to change(LineItem, :count).by(1)
    end

    it 'should create line_item via ajax' do
      expect {
        xhr :post, :create, product_id: product
      }.to change(LineItem, :count).by(1)
    end

    it 'redirects to carts#show' do
      post :create, product_id: product
      expect(response).to redirect_to store_path
    end
  end
end
