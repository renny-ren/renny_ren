class Message < ApplicationRecord
  validates_presence_of :body
  validates :body, length: { maximum: 50 }
  validates :author, length: { maximum: 15 }

  def self.send_feedback_email(body, contact_info)
    MessageMailer.feedback_email(body, contact_info).deliver_later
  end
end
