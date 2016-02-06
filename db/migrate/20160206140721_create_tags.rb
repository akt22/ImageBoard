class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag
      t.references :micropost, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tags, :tag
  end
end
