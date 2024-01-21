class Post < ApplicationRecord
  belongs_to :user
#  has_many :post_tags, dependent: :destroy
#  has_many :tags, through: :tag_posts, dependent: :destroy
  mount_uploader :post_image, AvatarUploader

  validates :body, length: { maximum: 65_535 }, presence: true

  enum post_type: { question: 0, tweet: 1 }
end
