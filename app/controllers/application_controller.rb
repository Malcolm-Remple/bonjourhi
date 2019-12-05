class ApplicationController < ActionController::Base
  before_action :set_title
  before_action :authenticate_user!

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def set_title
    @header_title = ""
  end
end
