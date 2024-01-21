class ProfilesController < ApplicationController
    before_action :set_user, only: %i[edit update]

    def show; end
  
    def edit; end
  
    def update
      if @user.update(user_params)
        redirect_to profile_path, success: t('profiles.update.success', item: User.model_name.human)
      else
        flash.now[:danger] = t('profiles.update.failure', item: User.model_name.human)
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_user
      @user = User.find(current_user.id)
    end
  
    def user_params
      params.require(:user).permit(:email, :name, :bio, :avatar, :avatar_cache)
    end
end
