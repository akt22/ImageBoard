require 'test_helper'

class StarTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @micropost = microposts(:orange)
    @star = @micropost.stars.build(user_id: @user.id, micropost_id: @micropost.id)
    @star.save
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @star.user_id = nil
    assert_not @star.valid?
  end

  test "micropost id should be present" do
    @star.micropost_id = nil
    assert_not @star.valid?
  end

  test "star should be unique" do
   same_star = @micropost.stars.build(user_id: @user.id)
   same_star.save
    assert_not same_star.valid?
  end

end
