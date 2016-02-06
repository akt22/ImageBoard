class StarsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :upload]
  before_action :correct_user, only: :destroy

  def create
    @micropost = Micropost.find_by(id: params[:micropost_id])
    @star = @micropost.stars.build(user_id: current_user.id, micropost_id: @micropost.id)
    if @star.save
      flash[:success] = "いいねしました。"
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    @star = current_user.stars.find_by(id: params[:id])
    @star.destroy
    redirect_to request.referrer || root_url
  end

  private

    def correct_user
      @star = current_user.stars.find_by(id: params[:id])
      redirect_to root_url if @star.nil?
    end

end
