class UserLanguagesController < ApplicationController
  before_action :set_user_language, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    @user_language.update(user_language_params)
    redirect_to user_path(current_user)
  end

  def new
    @user_language = UserLanguage.new
    # get params from url
    ul_type = params[:ul_type]
    proficiencies = [['Native', 5],['Advanced', 4],['Intermediate', 3],['Elementary', 2],['Beginner', 1]]

    if ul_type == 'sharing'
      # generate variables for new sharing language
      @ul_string = 'language you can share'
      # get all available languages the user isn't already sharing
      @languages = Language.all - current_user.user_languages.where(sharing: true).map {|ul| ul.language}
      @proficiencies = proficiencies
      @sharing_bool = 1
      @seeking_bool = 0
    else
      # generate variables for new seeking language
      @ul_string = 'language you want to practice speaking'
      # get all available languages the user isn't already seeking
      @languages = Language.all - current_user.user_languages.where(seeking: true).map {|ul| ul.language}
      @proficiencies = proficiencies.reverse
      @sharing_bool = 0
      @seeking_bool = 1
    end
  end

  def create
    user_language = UserLanguage.new(user_language_params)
    user_language.user = current_user
    if user_language.save
      redirect_to my_account_path
    else
      render :new
    end
  end

  def destroy
    @user_language.destroy

    redirect_to my_account_path
  end

  private

  def set_user_language
    @user_language = UserLanguage.find(params[:id])
  end

  def user_language_params
    params.require(:user_language).permit(:language_id, :proficiency, :seeking, :sharing)
  end
end
