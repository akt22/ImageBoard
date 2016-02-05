class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :stars, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size

  def star_user(user)
    self.stars.find_by(user_id: user)
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "5MB以上の画像をアップロードすることはできません。")
      end
    end
end
