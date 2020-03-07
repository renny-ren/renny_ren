class Message < ApplicationRecord
  validates_presence_of :body
  validates :author, length: { maximum: 15 }

  def self.send_feedback_email(author, contact_info, body)
    MessageMailer.feedback_email(author, contact_info, body).deliver_later
  end
end
