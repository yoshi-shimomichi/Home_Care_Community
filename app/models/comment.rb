class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  mount_uploader :comment_image, AvatarUploader

  validates :body, length: { maximum: 10_000 }, presence: true
  
end
