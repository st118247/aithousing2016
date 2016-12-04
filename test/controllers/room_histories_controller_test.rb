require 'test_helper'

class RoomHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_history = room_histories(:one)
  end

  test "should get index" do
    get room_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_room_history_url
    assert_response :success
  end

  test "should create room_history" do
    assert_difference('RoomHistory.count') do
      post room_histories_url, params: { room_history: { RoomManagement_id: @room_history.RoomManagement_id, allocated_user_id: @room_history.allocated_user_id, arrival_date: @room_history.arrival_date, category_no: @room_history.category_no, deallocated_user_id: @room_history.deallocated_user_id, dorm: @room_history.dorm, leave_date: @room_history.leave_date, student_id: @room_history.student_id } }
    end

    assert_redirected_to room_history_url(RoomHistory.last)
  end

  test "should show room_history" do
    get room_history_url(@room_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_history_url(@room_history)
    assert_response :success
  end

  test "should update room_history" do
    patch room_history_url(@room_history), params: { room_history: { RoomManagement_id: @room_history.RoomManagement_id, allocated_user_id: @room_history.allocated_user_id, arrival_date: @room_history.arrival_date, category_no: @room_history.category_no, deallocated_user_id: @room_history.deallocated_user_id, dorm: @room_history.dorm, leave_date: @room_history.leave_date, student_id: @room_history.student_id } }
    assert_redirected_to room_history_url(@room_history)
  end

  test "should destroy room_history" do
    assert_difference('RoomHistory.count', -1) do
      delete room_history_url(@room_history)
    end

    assert_redirected_to room_histories_url
  end
end
