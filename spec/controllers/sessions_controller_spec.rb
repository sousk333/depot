require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
    before do
      @user = create(:user)
    end

    context "with valid attributes" do
      it "should login" do
        post :create, user: { name: @user.name, password: @user.password }
        expect(response).to redirect_to admin_url
        expect(session[:user_id]).to eq @user.id
      end
    end

    context "with invalid attributes" do
      it "should fail login" do
        post :create, user: { name: @user.name, password: "miss" }
        expect(response).to redirect_to login_url
      end
    end
  end

  describe "GET destroy" do
    before do
      @user = create(:user)
    end

    it "should logout" do
      get :destroy
      expect(response).to redirect_to store_url
    end
  end
end
