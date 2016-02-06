class Tag < ActiveRecord::Base
  belongs_to :micropost
  validates :tag, presence: true
end
