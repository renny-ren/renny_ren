class Comment < ApplicationRecord
  belongs_to :owner, polymorphic: true

  after_create :send_notification_to_site_owner

  scope :sorted, -> { order('created_at DESC') }

  def send_notification_to_site_owner
    CommentMailer.email_to_site_owner(self).deliver_later
  end
end
