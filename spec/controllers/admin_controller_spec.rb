require 'rails_helper'

RSpec.describe AdminController, :type => :controller do
  before do
    login_as create(:user)
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
