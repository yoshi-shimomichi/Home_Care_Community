class ChangeTagPostsToPostTags < ActiveRecord::Migration[7.0]
  def change
    rename_table :tag_posts, :post_tags
  end
end
