class Star < ActiveRecord::Base
  belongs_to :user
  # belongs_to :micropost
  belongs_to :prototype, counter_cache: :stars_count

end
