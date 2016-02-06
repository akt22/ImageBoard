require 'test_helper'

class StarsControllerTest < ActionController::TestCase
  def setup
    @user = users(:michael)
    @micropost = microposts(:orange)
    @star = @micropost.stars.build(user_id: @user.id, micropost_id: @micropost.id)
    @star.save
  end

  # test "should unstar" do
  #   Rails::logger.debug "STAR_ID: #{@star.id}"
  #   assert_difference 'Star.count', -1 do
  #     delete star_path(@star)
  #   end
  # end

  test "should redirect star when not logged in" do
    assert_no_difference 'Star.count' do
      post :create, { micropost_id: @micropost.id }
    end
    assert_redirected_to login_url
  end
end
