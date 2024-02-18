class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  has_one :care_persons, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :favorite_posts, through: :post_favorites, source: :post
  has_many :comment_favorites, dependent: :destroy
  has_many :favorite_comments, through: :comment_favorites, source: :comment
  has_many :active_notifications, class_name: 'PostNotification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'PostNotification', foreign_key: 'visited_id', dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, length: { maximum: 20 }, presence: true
  validates :reset_password_token, uniqueness: true, allow_nil: true

  def own?(object)
    id == object&.user_id
  end

  def post_favorite_join(post)
    favorite_posts << post
  end

  def post_favorite_remove(post)
    favorite_posts.destroy(post)
  end

  def favorite_post?(post)
    favorite_posts.include?(post)
  end

  def comment_favorite_join(comment)
    favorite_comments << comment
  end

  def comment_favorite_remove(comment)
    favorite_comments.destroy(comment)
  end

  def favorite_comment?(comment)
    favorite_comments.include?(comment)
  end
end
