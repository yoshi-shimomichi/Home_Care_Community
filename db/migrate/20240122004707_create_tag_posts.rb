class CreateTagPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_posts do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
