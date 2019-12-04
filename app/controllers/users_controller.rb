class UsersController < ApplicationController
  def index
    @header_title = "Match partners"
    if params[:city].present?

      city = params[:city]
      language_id = params[:language]

      # @users = User.joins(:user_languages).where(city: city, user_languages: { language_id: language, sharing: true })
      @users = User.joins(:user_languages).where(
        "city ILIKE :city
        AND user_languages.language_id = :language_id
        AND user_languages.sharing = true
      ", city: city, language_id: language_id)

    else
      @users = User.where.not("id = ?", current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
    @header_title = ""
    @user_languages = UserLanguage.where("user_id = ?", params[:id])
    @title = "Bonjourhi | " + @user.first_name + " " + @user.last_name
  end

  def edit
    @user = User.find(params[:id])
    @header_title = "Edit Your Info"
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
