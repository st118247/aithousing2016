require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should validate uniqueness of email" do
    old_user = users(:one)
    email = User.new email: old_user.email
    assert !email.valid?
    assert_equal "has already been taken", email.errors[:email][0]
  end
end
