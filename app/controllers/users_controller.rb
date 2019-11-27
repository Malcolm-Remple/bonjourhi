class UsersController < ApplicationController
  def index
    @users = User.where.not("id = ?", current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

    @user_languages = UserLanguage.where("user_id = ?", current_user.id)

    # @user.update(user_params)

  end

  private

  def user_params
    # params.require(:user).permit(:)
  end

end
