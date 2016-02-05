module MicropostsHelper
  def get_stars(micropost)
    Star.where(micropost_id: micropost.id)
  end

  def stars_counter(micropost)
    stars = get_stars micropost
    stars.count unless stars.nil?
  end
end
