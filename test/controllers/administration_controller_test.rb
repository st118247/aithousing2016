require 'test_helper'

class AdministrationControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = users(:one)
    @manager = users(:two)
    @staff = users(:three)
    @newuser = users(:four)
    @role_staff = officer_roles(:three)
  end

  test "should get userlist" do
    get administration_userlist_url
    assert_response :success
  end

  test "should get statistics" do
    sign_in @admin
    get administration_statistics_url
    assert_response :success
  end

  test "should not active user validating" do
    sign_in @staff
    ability = Ability.new(@staff)
    # assert ability.can?(:activeuser, :administration)
    get administration_activeuser_url, params: { which_user: @staff.id }
    assert_redirected_to root_url
  end

  test "staff should get statistics" do
    sign_in @staff
    ability = Ability.new(@staff)
    assert ability.can?(:statistics, :administration)
    # assert ability.cannot?(:activeuser, :administration)
  end

  test "staff should get userlist" do
    sign_in @staff
    ability = Ability.new(@staff)
    assert ability.can?(:userlist, :administration)
  end

  test "manager should active user" do
    sign_in @manager
    ability = Ability.new(@manager)
    # assert ability.can?(:activeuser, :administration)
    get administration_activeuser_url, params: { which_user: @staff.id }
    assert_redirected_to administration_userlist_url
  end

  test "admin should ban user " do
    sign_in @admin
    ability = Ability.new(@admin)
    # assert ability.can?(:activeuser, :administration)
    get administration_banuser_url, params: { which_user: @staff.id }
    assert_redirected_to administration_userlist_url
  end

  test "admin should assign role " do
    sign_in @admin
    ability = Ability.new(@admin)
    # assert ability.can?(:activeuser, :administration)
    post administration_assignrole_url, params: { which_user: @newuser.id, assignRole: {officer_role: @role_staff.id} }
    assert_redirected_to administration_userlist_url
  end
end
