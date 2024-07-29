require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin)
    @user = users(:regular_user)
  end

  test "should get index as admin" do
    sign_in @admin
    get users_path
    assert_response :success
  end

  test "should create user as admin" do
    sign_in @admin
    assert_difference('User.count') do
      post users_path, params: { user: { username: "newuser", email: "newuser@example.com", password: "password", password_confirmation: "password", user_type: "trader" } }
    end
    assert_redirected_to user_path(User.last)
  end

  test "should get index as regular user" do
    sign_in @user
    get users_path
    assert_response :success
  end

  test "should not create user as regular user" do
    sign_in @user
    assert_no_difference('User.count') do
      post users_path, params: { user: { username: "newuser", email: "newuser@example.com", password: "password", password_confirmation: "password", user_type: "admin" } }
    end
    assert_redirected_to root_path # Or some other appropriate path
  end
end
