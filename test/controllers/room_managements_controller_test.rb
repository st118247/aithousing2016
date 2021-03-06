require 'test_helper'

class RoomManagementsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @admin = users(:one)
    @room_management = room_managements(:one)
    @room_history = room_managements(:two)
  end

  test "should get index" do
    sign_in @admin
    get room_managements_url
    assert_response :success
  end

  test "should get new" do
    sign_in @admin
    get new_room_management_url
    assert_response :success
  end

  test "should create room_management" do
    sign_in @admin
    assert_difference('RoomManagement.count') do
      # post room_managements_url, params: { room_management: { category_no: @room_management.category_no, dorm: @room_management.dorm, room_no: @room_management.room_no, status: @room_management.status, user_id: @room_management.user_id } }
      param = { room_management: { category_no: @room_management.category_no, dorm: @room_management.dorm, room_no: "S123", status: @room_management.status, user_id: @room_management.user_id }}
      post room_managements_url, params: param

    end

    assert_redirected_to room_management_url(RoomManagement.last)
  end

  test "should show room_management" do
    sign_in @admin
    get room_management_url(@room_management)
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin
    get edit_room_management_url(@room_management)
    assert_response :success
  end

  test "should update room_management" do
    sign_in @admin
    patch room_management_url(@room_management), params: { room_management: { arrival_date: @room_management.arrival_date, category_no: @room_management.category_no, dorm: @room_management.dorm, room_no: @room_management.room_no, status: @room_management.status, student_id: @room_management.student_id, user_id: @room_management.user_id } }
    assert_redirected_to room_management_url(@room_management)
  end

  test "should update room_management of occupied status" do
    sign_in @admin
    patch room_management_url(@room_history), params: { room_management: { arrival_date: @room_history.arrival_date, category_no: @room_history.category_no, dorm: @room_history.dorm, room_no: @room_history.room_no, status: @room_history.status, student_id: @room_history.student_id, user_id: @room_history.user_id } }
    assert_redirected_to room_management_url(@room_history)
  end

  test "should update room_management to room history" do
    sign_in @admin
    patch room_management_url(@room_history), params: { room_management: { "arrival_date(1i)": 2020, "arrival_date(2i)": 11, "arrival_date(3i)": 30,"arrival_date(4i)": 14, "arrival_date(5i)": 32, category_no: @room_history.category_no, dorm: @room_history.dorm, room_no: @room_history.room_no, status: "Available", student_id: @room_management.student_id, user_id: @room_management.user_id } }
    assert_redirected_to room_management_url(@room_history)
  end

  # test "should not destroy room_management" do
  #   sign_in @admin
  #   assert_no_difference('RoomManagement.count', -1) do
  #     delete room_management_url(@room_management)
  #   end
  #
  #   assert_redirected_to room_managements_url
  # end
end
