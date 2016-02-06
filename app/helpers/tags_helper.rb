module TagsHelper
  def tagged_micropost(tag)
    micropost = Micropost.find_by(id: tag.micropost_id)
  end
end
