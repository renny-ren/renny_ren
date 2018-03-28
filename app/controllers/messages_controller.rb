class MessagesController < ApplicationController
  def index
  end

  def create
    @messages = Message.all
    @message = Message.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:body, :author)
  end
end
