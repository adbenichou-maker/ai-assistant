class MessagesController < ApplicationController
  before_action :set_chat

  def create
    # 1. Save user message
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"
    @message.save

    # 2. Build full conversation context
    ruby_llm_chat = RubyLLM.chat

    # 3. System prompt + history messages + new user message
    messages_for_llm = [
      { role: "system", content: ChatsController::SYSTEM_PROMPT }
    ]

    @chat.messages.order(:created_at).each do |m|
      messages_for_llm << { role: m.role, content: m.content }
    end

    # 4. Ask the LLM
    response = ruby_llm_chat.ask(messages_for_llm)

    # 5. Save assistant response
    Message.create!(
      chat: @chat,
      role: "assistant",
      content: response.content
    )

    redirect_to chat_path(@chat)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_chat
    @chat = current_user.chats.find(params[:chat_id])
  end
end
