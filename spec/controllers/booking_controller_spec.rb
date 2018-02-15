require 'rails_helper'

RSpec.describe BookingController, type: :controller do

  describe "GET #roomBook" do
    it "returns http success" do
      get :roomBook
      expect(response).to have_http_status(:success)
    end
  end

end
