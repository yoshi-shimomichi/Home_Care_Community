class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

#  has_many :posts, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, length: { maximum: 20 }, presence: true
  validates :reset_password_token, uniqueness: true, allow_nil: true
end
