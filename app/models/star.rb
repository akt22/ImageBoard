class Star < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  # belongs_to :prototype, counter_cache: :stars_count
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  validates :user_id, uniqueness: { scope: [:micropost_id] }
end
