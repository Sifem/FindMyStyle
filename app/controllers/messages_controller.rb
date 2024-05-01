class MessagesController < ApplicationController
  before_action :set_chat, only: [:ai_stylist, :ai_stylist_message]

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.response = ai(@message.content)
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  def ai_stylist
    ai_silhouette = @user.silhouettes.first
    content = "I have a #{ai_silhouette.neutral_silhouette} silhouette
    and would like some clothing recommendations. Respond with
    'Hello, I'm Margot your stylist. Let's build a killer wardrobe together!'"
    @greeting = ai(content)
    # @user.messages.last.destroy if (@user.messages.last.created_at + 0.5) < Time.now
  end

  def ai_stylist_message
    @message = Message.new(message_params)
    ai_silhouette = current_user.silhouettes.first
    content = "I have a #{ai_silhouette.neutral_silhouette} silhouette
    and would like some clothing recommendations. I got this recommendation #{@user.silhouettes.first.recommendations.first.description}
    And my question is #{@message.content}. If the question is about another topic, say you only give advise about fashion in one sentence, and don't give any fashion advice at all. Respond as if you are my best friend. Address me using words like honey, darling, sweetheart, gorgeous etc. You may use the book “The Triumph of Individual Style: A Guide to Dressing Your Body, Your Beauty, Your Self Paperback – October 1, 2002
    by Carla Mason Mathis(Author),Helen Villa Connor(Author), but don't mention it to me. Sound like a fashionista, chic and creative."
    chaptgpt_response = ai(content)
    @message.response = chaptgpt_response["choices"][0]["message"]["content"]
    @message.user_id = @user.id
    @message.save
    redirect_to ai_stylist_path
  end

  private

  def set_chat
    @user = User.find(current_user.id)
    @message = Message.new
    @messages = Message.where(user_id: current_user)
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def ai(user_content)
    # raise
    client = OpenAI::Client.new
    ai_silhouette = current_user.silhouettes.first
    base = "I have a #{ai_silhouette.neutral_silhouette} silhouette
    and would like some clothing recommendations. I got this recommendation
    #{current_user.silhouettes.first.recommendations.first.description}
    And my question is #{user_content}. If the question is about another topic, say you only give advise about fashion in one sentence, and absolutely don't give any fashion advice at all. Respond as if you are my best friend. Address me using words like honey, darling, sweetheart, gorgeous etc. You may use the book “The Triumph of Individual Style: A Guide to Dressing Your Body, Your Beauty, Your Self Paperback – October 1, 2002
    by Carla Mason Mathis(Author),Helen Villa Connor(Author), but don't mention it to me. Sound like a fashionista, chic and creative."
    chaptgpt_response = client.chat(parameters: { model: "gpt-3.5-turbo", messages: [{ role: "user", content: base }] })
    chaptgpt_response["choices"][0]["message"]["content"]
  end
end
