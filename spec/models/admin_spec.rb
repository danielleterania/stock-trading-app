require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a username, email, and password" do
    user = User.new(username: "johndoe1", email: "johndoe1@example.com", password: "password", password_confirmation: "password")
    expect(user).to be_valid
  end

  it "is not valid without a username" do
    user = User.new(username: nil, email: "johndoe@example.com", password: "password", password_confirmation: "password")
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user = User.new(username: "johndoe", email: nil, password: "password", password_confirmation: "password")
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user = User.new(username: "johndoe", email: "johndoe@example.com", password: nil, password_confirmation: nil)
    expect(user).to_not be_valid
  end
end
