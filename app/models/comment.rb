class Comment < ApplicationRecord
  belongs_to :owner, polymorphic: true

  after_create :send_notification_to_site_owner

  def send_notification_to_site_owner
    CommentMailer.email_to_site_owner(self).deliver_later
  end
end
