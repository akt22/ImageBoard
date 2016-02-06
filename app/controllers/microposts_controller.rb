class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :upload]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "つぶやきました。"
      tagging if @micropost.picture?
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "つぶやきを削除しました。"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

    def tagging
      begin
        (vision @micropost.picture.file.path).each do |res|
          @micropost.tags.build(tag: res[1].strip).save
        end
      rescue => e
        p "API Error."
      end
    end

    def vision(file_path)
      http_client = HTTPClient.new
      endpoint_uri = 'http://www.ai.cs.kobe-u.ac.jp/vision'
      content = Base64.strict_encode64(File.new(file_path, 'rb').   read)
      response = http_client.post_content(endpoint_uri, request_json(content), 'Content-Type' => 'application/json')
      parse_result(response)
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

    def parse_result(response)
      JSON.parse(response)['result']
    end
end
