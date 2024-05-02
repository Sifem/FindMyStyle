class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    if Message.all.count < 1
      @message = Message.new
      @message.response = "Let's unlock your style potential. I'm here for all your outfit questions. What's the occasion?"
      @message.chatroom = @chatroom
      @message.user = current_user
      @message.save!
      @message = Message.new
    end
  end
end
