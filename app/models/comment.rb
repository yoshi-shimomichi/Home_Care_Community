class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
  has_many :comment_favorites, dependent: :destroy

  mount_uploader :comment_image, AvatarUploader

  validates :body, length: { maximum: 1000 }, presence: true

  def comment_favorited_by?(user)
    comment_favorites.where(user_id: user).exists?
  end
  
end
