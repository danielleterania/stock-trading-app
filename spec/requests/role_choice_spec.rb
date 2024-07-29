require 'rails_helper'

RSpec.describe "RoleChoices", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/role_choice/index"
      expect(response).to have_http_status(:success)
    end
  end

end
