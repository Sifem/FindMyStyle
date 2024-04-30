class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    if Message.all.count < 1
      @message = Message.new
      @message.response = "Hey! I'm your stylist Sifem, how can I help?"
      @message.chatroom = @chatroom
      @message.user = current_user
      @message.save!
      @message = Message.new
    end
  end
end
