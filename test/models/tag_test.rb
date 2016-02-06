require 'test_helper'

class TagTest < ActiveSupport::TestCase

  def setup
    @micropost = microposts(:orange)
    @tag = @micropost.tags.create(tag: "label")
    @tag.save
  end

  test "should be valid" do
    assert @tag.valid?
  end

  test "micropost_id shold be present" do
    @tag.micropost_id = " "
    assert_not @tag.valid?
  end
end
