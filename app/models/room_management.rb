class RoomManagement < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :room_no
  has_many :room_histories
end
