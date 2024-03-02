require 'rails_helper'

RSpec.describe PostFavorite, type: :model do

  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      post_favorite = build(:post_favorite)
      expect(post_favorite).to be_valid
    end
  end

  context 'ユーザーと投稿の組み合わせがユニークでない場合' do
    it '無効であること' do
      post_favorite = create(:post_favorite)
      new_post_favorite = build(:post_favorite, user: post_favorite.user, post: post_favorite.post)
      new_post_favorite.valid?
      expect(new_post_favorite.errors[:user_id]).to include('はすでに存在します'), 'post_favoriteとuserのユニークバリデーションが設定されていません'
    end
  end
end
