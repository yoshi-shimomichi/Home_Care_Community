class CarePersonsController < ApplicationController
    before_action :set_care_person, only: %i[edit update]

    def show; end
  
    def edit; end
  
    def update
      if @care_person.update(care_person_params)
        redirect_to profile_path, success: t('profiles.update.success')
      else
        flash.now[:danger] = t('profiles.update.failure')
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_care_person
      @care_person = CarePerson.find(user_id: current_user.id)
    end
  
    def care_person_params
      params.require(:care_person).permit(:user_id, :age, :sex, :care_level, :bio)
    end  
end
