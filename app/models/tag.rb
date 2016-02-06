class Tag < ActiveRecord::Base
  belongs_to :micropost
  validates :micropost_id, presence: true
end
