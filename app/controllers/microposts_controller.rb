class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :upload]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created"
      if @micropost.picture?
        (vision @micropost.picture.file.path).each do |r|
          p r
        end
      end
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:picture_cache, :content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

    def vision(file_path)
      http_client = HTTPClient.new
      endpoint_uri = 'http://www.ai.cs.kobe-u.ac.jp/vision'
      content = Base64.strict_encode64(File.new(file_path, 'rb').   read)
      response = http_client.post_content(endpoint_uri,     request_json(content), 'Content-Type' => 'application/json'  )
      result_parse(response)
    end

    def request_json(content)
      {
        requests: [{
          img: {
            content: content
          }
        }]
      }.to_json
    end

    def result_parse(response)
      JSON.parse(response)['result']
    end
end
