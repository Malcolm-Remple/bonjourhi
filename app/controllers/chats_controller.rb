require 'securerandom'

class ChatsController < ApplicationController

  def index
    chats = current_user.chats
    @existing_chats_users = current_user.existing_chats_users
  end

  # user_chats POST  /users/:user_id/chats
  # creates new chat between users if not exist, or takes to you show page of existing
  def create
    @other_user = User.find(params[:other_user])
    @chat = find_chat(@other_user) || Chat.new(identifier: SecureRandom.hex)
    # raise
    if !@chat.persisted?
      @chat.save
      @chat.subscriptions.create(user_id: current_user.id)
      @chat.subscriptions.create(user_id: @other_user.id)
    end
    redirect_to user_chat_path(current_user, @chat, other_user: @other_user.id)
  end

  def show
    @other_user = User.find(params[:other_user])
    @chat = Chat.find_by(id: params[:id])
    @message = Message.new
  end

# private

  def find_chat(second_user)
    chats = current_user.chats
    chats.each do |chat|
      chat.subscriptions.each do |s|
        if s.user_id == second_user.id
          return chat
        end
      end
    end
    nil
  end

end
