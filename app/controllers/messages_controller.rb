class MessagesController < ApplicationController
  before_action :set_messages, only: [:create, :destroy]

  def create
    @message = Message.new(message_params)
    @message.save
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  def feedback
    if message_params[:body].blank?
      render plain: 'failed', status: 400
    else
      Message.send_feedback_email(message_params[:author], message_params[:contact_info], message_params[:body])
      render plain: 'success', status: 200
    end
  end

  private

  def set_messages
    @messages = Message.order('id DESC')
  end

  def message_params
    params.require(:message).permit(:body, :author)
  end
end
