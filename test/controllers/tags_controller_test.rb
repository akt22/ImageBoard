require 'test_helper'

class TagsControllerTest < ActionController::TestCase

  def setup
    @micropost = microposts(:orange)
    @tag = @micropost.tags.build(tag: "label")
    @tag.save
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
