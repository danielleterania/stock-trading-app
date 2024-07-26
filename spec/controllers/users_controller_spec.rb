require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # Tests for the #new action
  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end
  end

  # Tests for the #create action
  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect {
          post :create, params: { user: { username: "johndoe", email: "johndoe@example.com", password: "password", password_confirmation: "password" } }
        }.to change(User, :count).by(1)
      end

      it "redirects to the new user" do
        post :create, params: { user: { username: "johndoe", email: "johndoe@example.com", password: "password", password_confirmation: "password" } }
        expect(response).to redirect_to(User.last)
      end
    end

    context "with invalid attributes" do
      it "does not create a new user" do
        expect {
          post :create, params: { user: { username: nil, email: "johndoe@example.com", password: "password", password_confirmation: "password" } }
        }.to_not change(User, :count)
      end

      it "re-renders the new template" do
        post :create, params: { user: { username: nil, email: "johndoe@example.com", password: "password", password_confirmation: "password" } }
        expect(response).to render_template(:new)
      end
    end
  end

  # Tests for the #show action
  describe "GET #show" do
    let(:user) { User.create!(username: "johndoe", email: "johndoe@example.com", password: "password", password_confirmation: "password") }

    it "returns a successful response" do
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it "renders the show template" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end
end
