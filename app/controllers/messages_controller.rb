class MessagesController < ApplicationController
  before_action :set_messages, only: [:create, :destroy]
  def index
  end

  def create
    @message = Message.new(message_params)
    @message.save
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private

  def set_messages
    @messages = Message.all
  end

  def message_params
    params.require(:message).permit(:body, :author)
  end
end
