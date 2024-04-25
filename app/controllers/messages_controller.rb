class MessagesController < ApplicationController
  before_action :set_chat, only: [:ai_stylist, :ai_stylist_message]

  def ai_stylist
    ai_silhouette = @user.silhouettes.first
    content = "I have a #{ai_silhouette.neutral_silhouette} silhouette
    and would like some clothing recommendations. Respond with
    'Hello, I'm Sifem your stylist. How can I help?'"
    chaptgpt_response = ai(content)
    @greeting = chaptgpt_response["choices"][0]["message"]["content"]
    return unless @user.messages.last

    @response = @user.messages.last.response
    @user.messages.last.destroy if (@user.messages.last.created_at + 0.5) < Time.now
  end

  def ai_stylist_message
    @message = Message.new(message_params)
    ai_silhouette = @user.silhouettes.first
    content = "I have a #{ai_silhouette.neutral_silhouette} silhouette
    and would like some clothing recommendations. I got this recommendation #{@user.silhouettes.first.recommendations.first.description} And my question is #{@message.content}. Only respond with answers regarding fashion.'"
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
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def ai(content)
    client = OpenAI::Client.new
    client.chat(parameters: { model: "gpt-3.5-turbo", messages: [{ role: "user", content: }] })
  end
end
