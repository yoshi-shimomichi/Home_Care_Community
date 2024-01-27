class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  mount_uploader :comment_image, AvatarUploader

  validates :body, length: { maximum: 65_535 }, presence: true
  
end
