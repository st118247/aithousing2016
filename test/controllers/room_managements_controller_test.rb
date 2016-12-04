require 'test_helper'

class RoomManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_management = room_managements(:one)
  end

  test "should get index" do
    get room_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_room_management_url
    assert_response :success
  end

  test "should create room_management" do
    assert_difference('RoomManagement.count') do
      post room_managements_url, params: { room_management: { arrival_date: @room_management.arrival_date, category_no: @room_management.category_no, dorm: @room_management.dorm, room_no: @room_management.room_no, status: @room_management.status, student_id: @room_management.student_id, user_id: @room_management.user_id } }
    end

    assert_redirected_to room_management_url(RoomManagement.last)
  end

  test "should show room_management" do
    get room_management_url(@room_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_management_url(@room_management)
    assert_response :success
  end

  test "should update room_management" do
    patch room_management_url(@room_management), params: { room_management: { arrival_date: @room_management.arrival_date, category_no: @room_management.category_no, dorm: @room_management.dorm, room_no: @room_management.room_no, status: @room_management.status, student_id: @room_management.student_id, user_id: @room_management.user_id } }
    assert_redirected_to room_management_url(@room_management)
  end

  test "should destroy room_management" do
    assert_difference('RoomManagement.count', -1) do
      delete room_management_url(@room_management)
    end

    assert_redirected_to room_managements_url
  end
end
