require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST create" do
    let(:user) { attributes_for(:user) }

    it "should create yser" do
      expect { post :create, user: user }.to change(User, :count).by(1)
    end

    it "redirects to users#index" do
      post :create, user: user
      expect(response).to redirect_to users_path
    end
  end

  describe "PATCH update" do
    before do
      @user = create(:user)
    end

    let(:update_user) { attributes_for(:user) }

    it "should update user" do
      patch :update, id: @user, user: update_user
      @user.reload
      expect(@user.name).to eq update_user[:name]
    end

    it "redirects to users#index" do
      patch :update, id: @user, user: update_user
      expect(response).to redirect_to users_path
    end
  end
end
