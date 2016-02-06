require 'test_helper'

class StaringTest < ActionDispatch::IntegrationTest
  def setup
    @user     = users(:michael)
    @micropost = microposts(:orange)
  end

  test "should star a user the standard way" do
    log_in_as(@user)
    get root_path
    assert_difference 'Star.count', 1 do
      post stars_path, micropost_id: @micropost.id
    end
  end

  test "should star a user with ajax" do
    log_in_as(@user)
    get root_path
    assert_difference 'Star.count', 1 do
      xhr :post, stars_path, micropost_id: @micropost.id
    end
  end

  test "should unstar a user the standard way" do
    log_in_as(@user)
    star = @micropost.stars.build(user_id: @user.id, micropost_id: @micropost.id)
    star.save
    get root_path
    assert_difference 'Star.count', -1 do
      delete star_path(star)
    end
  end

  test "should unstar a user with ajax" do
    log_in_as(@user)
    star = @micropost.stars.build(user_id: @user.id, micropost_id: @micropost.id)
    star.save
    assert_difference 'Star.count', -1 do
      xhr :delete, star_path(star)
    end
  end

  test "should count decrease when micropost is deleted" do
    log_in_as(@user)
    star = @micropost.stars.build(user_id: @user.id, micropost_id: @micropost.id)
    star.save
    num_star = @micropost.stars.count
    assert_difference 'Micropost.count', -1 * num_star do
      delete micropost_path(@micropost)
    end
  end
end
