class MeetupsController < ApplicationController

  def index
    @outbound_meetup_requests = current_user.outbound_meetup_requests
    @inbound_meetup_requests = current_user.inbound_meetup_requests
    @confirmed_meetups = current_user.confirmed_meetups
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @meetup = Meetup.new
    @seeking_langs = current_user.user_languages.filter(&:seeking).map {|user_languages| user_languages.language}
    @sharing_langs = current_user.user_languages.filter(&:sharing).map {|user_languages| user_languages.language}
  end

  def create
    @user = User.find(params[:user_id])
    @meetup = Meetup.new(meetup_params)
    @meetup.sharing_lang = Language.find(params[:meetup][:sharing_lang].to_i)
    @meetup.seeking_lang = Language.find(params[:meetup][:seeking_lang].to_i)
    @meetup.sender = current_user
    @meetup.recipient = @user
    if @meetup.save
      redirect_to meetups_path
    else
      render :new
    end
  end

  def update
    @meetup = Meetup.find(params[:id])
    @meetup.update_attribute(:confirmed, true)
    redirect_to meetups_path
  end

  private

  def meetup_params
    params.require(:meetup).permit(:date, :start_time, :duration, :location, :greeting)
  end

  def confirmed_meetup_params
    params.require(:meetup).permit(:confirmed)
  end
end
