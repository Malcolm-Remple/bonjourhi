class UserLanguagesController < ApplicationController
  before_action :set_user_language, only: [:edit, :update]

  def edit
  end

  def update
    @user_language.update(user_language_params)
    redirect_to user_path(current_user)
  end

  def new
    @user_language = UserLanguage.new
  end

  def create

  end

  def destroy
    @user_language.destroy

    redirect_to user_path(current_user)
  end

  private

  def set_user_language
    @user_language = UserLanguage.find(params[:id])
  end

  def user_language_params
    params.require(:user_language).permit(:proficiency, :seeking, :sharing)
  end
end
