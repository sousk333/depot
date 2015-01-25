require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  before do
    login_as create(:user)
  end

  describe 'DELETE destroy' do
    before do
      @cart = create(:cart)
      session[:cart_id] = @cart.id
    end

    it { expect { delete :destroy }.to change(Cart, :count).by(-1) }
  end
end
