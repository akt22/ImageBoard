class StarsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :upload]
  before_action :correct_user, only: :destroy

  def create
    @star = Star.create(user_id: current_user.id, micropost_id: params[:micropost_id])
    if @star.save
      flash[:success] = "いいねしました。"
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    @star = current_user.stars.find_by(micropost_id: params[:micropost_id])
    @star.destroy
    @stars = Star.where(micropost_id: params[:micropost_id])
  end
end
