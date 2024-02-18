class PostNotificationsController < ApplicationController
	def index
    #current_userの投稿に紐づいた通知一覧
    @notifications = current_user.passive_notifications.where(checked: false)
    #@notificationの中でまだ確認していない(indexに一度も遷移していない)通知のみ
  end

  def checked_all
    @notifications = current_user.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
    flash[:success] = "全ての通知を削除しました"
    redirect_to root_path
  end

  def checked
    @notification = PostNotification.find(params[:id])
    @notification.update(checked: true)
    redirect_to post_notifications_path
  end
end
