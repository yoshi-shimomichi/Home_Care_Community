require 'rails_helper'

RSpec.describe CommentFavorite, type: :model do
  
  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      comment_favorite = build(:comment_favorite)
      expect(comment_favorite).to be_valid
    end
  end

  context 'ユーザーとコメントの組み合わせがユニークでない場合' do
    it '無効であること' do
      comment_favorite = create(:comment_favorite)
      new_comment_favorite = build(:comment_favorite, user: comment_favorite.user, comment: comment_favorite.comment)
      new_comment_favorite.valid?
      expect(new_comment_favorite.errors[:user_id]).to include('はすでに存在します'), 'comment_favoriteとuserのユニークバリデーションが設定されていません'
    end
  end
end
