require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #searchView" do
    it "returns http success" do
      get :searchView
      expect(response).to have_http_status(:success)
    end
  end

end
