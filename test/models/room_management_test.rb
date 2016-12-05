require 'test_helper'

class RoomManagementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should validate uniqueness of room" do
    old_room = room_managements(:one)
    room_no = RoomManagement.new room_no: old_room.room_no
    assert !room_no.valid?
    assert_equal "Room no has already been taken", room_no.errors[:room_no][0]
  end
end
