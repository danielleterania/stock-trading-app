require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { User.create!(username: "johndoe", email: "johndoe@example.com", password: "password", password_confirmation: "password") }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @users" do
      get :index
      expect(assigns(:users)).to include(user)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new user with valid attributes" do
      expect {
        post :create, params: { user: { username: "newuser", email: "newuser@example.com", password: "password", password_confirmation: "password" } }
      }.to change(User, :count).by(1)
    end

    it "does not create a new user with invalid attributes" do
      expect {
        post :create, params: { user: { username: nil, email: "newuser@example.com", password: "password", password_confirmation: "password" } }
      }.to_not change(User, :count)
    end

    it "redirects to the new user on success" do
      post :create, params: { user: { username: "newuser", email: "newuser@example.com", password: "password", password_confirmation: "password" } }
      expect(response).to redirect_to(User.last)
    end

    it "re-renders the new template on failure" do
      post :create, params: { user: { username: nil, email: "newuser@example.com", password: "password", password_confirmation: "password" } }
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it "renders the show template" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    it "returns a successful response" do
      get :edit, params: { id: user.id }
      expect(response).to be_successful
    end

    it "renders the edit template" do
      get :edit, params: { id: user.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH #update" do
    it "updates the user with valid attributes" do
      patch :update, params: { id: user.id, user: { username: "updateduser", email: "updateduser@example.com", password: "newpassword", password_confirmation: "newpassword" } }
      user.reload
      expect(user.username).to eq("updateduser")
      expect(user.email).to eq("updateduser@example.com")
    end

    it "does not update the user with invalid attributes" do
      patch :update, params: { id: user.id, user: { username: nil, email: "updateduser@example.com", password: "newpassword", password_confirmation: "newpassword" } }
      user.reload
      expect(user.username).to eq("johndoe")
    end

    it "redirects to the user on success" do
      patch :update, params: { id: user.id, user: { username: "updateduser", email: "updateduser@example.com", password: "newpassword", password_confirmation: "newpassword" } }
      expect(response).to redirect_to(user)
    end

    it "re-renders the edit template on failure" do
      patch :update, params: { id: user.id, user: { username: nil, email: "updateduser@example.com", password: "newpassword", password_confirmation: "newpassword" } }
      expect(response).to render_template(:edit)
    end
  end
end
