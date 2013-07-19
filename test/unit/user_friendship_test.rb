require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creating a friendship works" do
    assert_nothing_raised do
      UserFriendship.create user: users(:ben), friend: users(:fred)
    end
  end

  test "that creating a friendship based on a user id and friend id works" do
    UserFriendship.create user_id: users(:ben).id, friend_id: users(:fred).id
    assert users(:ben).friends.include?(users(:fred)) 
  end
end
