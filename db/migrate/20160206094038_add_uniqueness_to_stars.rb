class AddUniquenessToStars < ActiveRecord::Migration
  def change
    add_index :stars, [:user_id, :micropost_id], unique: true
  end
end
