class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      # broadcasting out to messages channel including the chat_id so messages are broadcasted to specific chat only
      ActionCable.server.broadcast( "messages_#{message_params[:chat_id]}",
      # message and user hold the data we render on the page using javascript
      message: message.content,
      user: message.user.first_name,
      user_photo_url: message.user.photo
      )
    else
      redirect_to chats_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_id)
  end
end
