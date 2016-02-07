class TagsController < ApplicationController
  def index
    if params[:q].present?
      if params[:q][:tag_cont].blank?
        @search = Tag.search({tag_cont: "例. mountain"})
      else
        @search = Tag.search(params[:q])
      end
    else
      @search = Tag.search({tag_cont: "例. mountain"})
    end
    @res_micropost = @search.result.paginate(page: params[:page])
  end
end
