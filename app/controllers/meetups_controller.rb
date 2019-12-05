class MeetupsController < ApplicationController

  def index
    @header_title = "Your Meetups"
    @outbound_meetup_requests = current_user.outbound_meetup_requests
    @inbound_meetup_requests = current_user.inbound_meetup_requests
    @confirmed_meetups = current_user.confirmed_meetups
  end

  def show
    @meetup = Meetup.find(params[:id])

  end

  def new
    @header_title = "Request a Meetup"
    @user = User.find(params[:user_id])
    @meetup = Meetup.new
    @seeking_langs = @user.user_languages.filter(&:sharing).map {|user_languages| user_languages.language}
    @sharing_langs = current_user.user_languages.filter(&:sharing).map {|user_languages| user_languages.language}
    # @seeking_langs = @user.user_languages.filter(&:sharing).map {|user_languages| user_languages.language}.collect {|l| [ l.name, l.id ] }
    # @sharing_langs = current_user.user_languages.filter(&:sharing).map {|user_languages| user_languages.language}.collect {|l| [ l.name, l.id ] }

  end

  def create
    @user = User.find(params[:user_id])
    @meetup = Meetup.new(meetup_params)
    # seeking_l =  Language.find(params[:meetup][:seeking_lang].to_i)
    @meetup.sharing_lang = Language.find(params[:meetup][:sharing_lang].to_i)
    @meetup.seeking_lang_id = params[:meetup][:seeking_lang].to_i
    # @meetup.seeking_lang_id = seeking_l.id

    @meetup.sender = current_user

    @meetup.recipient = @user
    @seeking_langs = @user.user_languages.filter(&:sharing).map {|user_languages| user_languages.language}.collect {|l| [ l.name, l.id ] }
    @sharing_langs = current_user.user_languages.filter(&:sharing).map {|user_languages| user_languages.language}.collect {|l| [ l.name, l.id ] }

    if @meetup.save!

      redirect_to meetups_path
    else
      render :new
    end
  end

  def update
    @meetup = Meetup.find(params[:id])
    @meetup.update_attribute(:confirmed, true)

    respond_to do |format|
      format.js
    end
  end

  def get_token
    current_user.update(pending_event_confirmation: params[:meetup_id])
    client = Signet::OAuth2::Client.new(client_options)
    redirect_to client.authorization_uri.to_s
  end

  def new_event
    client = Signet::OAuth2::Client.new(client_options)

    client.code = params[:code]

    response = client.fetch_access_token!

    session[:authorization] = response
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client


    # @user = User.find(params[:user_id])
    @meetup = Meetup.find(current_user.pending_event_confirmation)
    starting_at = @meetup.date.to_datetime + @meetup.start_time.hour.hour + @meetup.start_time.min.minute
    ends_at     = starting_at + @meetup.duration.minute

    event = Google::Apis::CalendarV3::Event.new({
      start: Google::Apis::CalendarV3::EventDateTime.new(date_time: starting_at.rfc3339),
      end: Google::Apis::CalendarV3::EventDateTime.new(date_time: ends_at.rfc3339),
      summary: "Meetup with #{@meetup.sender.first_name} at #{@meetup.location}"
    })


    # event = Google::Apis::CalendarV3::Event.new({
    #   start: Google::Apis::CalendarV3::EventDateTime.new(date_time: DateTime.now),
    #   end: Google::Apis::CalendarV3::EventDateTime.new(date_time: DateTime.now + @meetup.duration.minute),
    #   summary: "Meetup with #{@meetup.sender.first_name}"
    # })

    # event = Google::Apis::CalendarV3::Event.new({
    #   start: Google::Apis::CalendarV3::EventDateTime.new(date: @meetup.start_time.to_date),
    #   end: Google::Apis::CalendarV3::EventDateTime.new(date: @meetup.end_time.to_date),
    #   summary: "Meetup with #{@meetup.sender.first_name}"
    # })

    service.insert_event("leagrelou@gmail.com", event)

    redirect_to meetups_url
  end

  private

  def client_options
    {
      client_id: ENV["GOOGLE_CLIENT_ID"],
      client_secret: ENV["GOOGLE_CLIENT_SECRET"],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: new_event_url
    }
  end

  def meetup_params
    params.require(:meetup).permit(:date, :start_time, :duration, :location, :greeting)
  end

  def confirmed_meetup_params
    params.require(:meetup).permit(:confirmed)
  end
end
