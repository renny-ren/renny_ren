class Message < ApplicationRecord
  validates_presence_of :body

  def self.send_feedback_email(body, contact_info)
    MessageMailer.feedback_email(body, contact_info).deliver_later
  end
end
