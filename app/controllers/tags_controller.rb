class TagsController < ApplicationController
  def index
    if params[:q].present?
      @search = Tag.search(params[:q])
    else
      @search = Tag.search({tag_cont: "例. mountain"})
    end
    @res_micropost = @search.result.paginate(page: params[:page])
  end
end
