class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :comments, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :Post_notifications, dependent: :destroy

  mount_uploader :post_image, AvatarUploader

  validates :post_type, presence: true
  validates :body, length: { maximum: 65_535 }, presence: true
  
  enum post_type: { question: 0, tweet: 1 }

  def post_favorited_by?(user)
    post_favorites.where(user_id: user).exists?
  end

  def save_tag(sent_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      tags << new_post_tag
    end
  end

  def create_notification_favorite(current_user)
    temp = PostNotification.where(visitor_id: current_user.id, visited_id: user_id, post_id: id, action: :favorite)
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: :favorite
      )
      notification.checked = true if notification.visitor_id == notification.visited_id
      notification.save if notification.valid?
    end
  end

  def create_notification_comment(current_user)
#    temp = PostNotification.where(visitor_id: current_user.id, visited_id: user_id, post_id: id, action: :comment)
#    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: :comment
      )
      notification.checked = true if notification.visitor_id == notification.visited_id
      notification.save if notification.valid?
#    end
  end






#  def create_notification_comment(current_user, comment_id)
#    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
#    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
#    temp_ids.each do |temp_id|
#      save_notification_comment(current_user, comment_id, temp_id['user_id'])
#    end
#    # まだ誰もコメントしていない場合は、投稿者に通知を送る
#    save_notification_comment(current_user, comment_id, user_id) if temp_ids.blank?
#  end

#  def save_notification_comment(current_user, comment_id, visited_id)
#    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
#   notification = current_user.active_notifications.new(
#      post_id: id,
#      comment_id: comment_id,
#      visited_id: visited_id,
#      action: :comment
#    )
#    # 自分の投稿に対するコメントの場合は、通知済みとする
#    if notification.visitor_id == notification.visited_id
#      notification.checked = true
#    end
#    notification.save if notification.valid?
#  end

end
