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

  def feedback
     if message_params[:body].blank?
      redirect_to about_index_path, alert: '请输入邮件内容'
    else
      Message.send_feedback_email(message_params[:body], message_params[:author])
      redirect_to about_index_path, flash: { success: "如果没有意外，我已收到你的邮件。感谢！" }
    end
  end

  private

  def set_messages
    @messages = Message.all
  end

  def message_params
    params.require(:message).permit(:body, :author)
  end
end
