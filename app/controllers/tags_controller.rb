class TagsController < ApplicationController
  def index
    @search = Tag.search(params[:q])
    @res_micropost = @search.result.paginate(page: params[:page])
  end
end
