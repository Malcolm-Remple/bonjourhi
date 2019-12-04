class UsersController < ApplicationController
  def index
    if params[:city].present?

      city = params[:city]
      language = params[:language]

      @users = User.joins(:user_languages).where(city: city, user_languages: { language_id: language, sharing: true })

      # @users.where("var = ? AND var = ?", city, montreal)
    else
      @users = User.where.not("id = ?", current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
    @header_title = "Show Title"
    @user_languages = UserLanguage.where("user_id = ?", params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def account_show
    @user = current_user
    @sharing_user_langs = @user.user_languages.filter(&:sharing)
    @seeking_user_langs = @user.user_languages.filter(&:seeking)
  end

  def account_update
  end

  private

  def user_params
    # params.require(:user).permit(:)
  end

end
