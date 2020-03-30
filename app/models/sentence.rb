class Sentence < ApplicationRecord
  self.per_page = 6

  has_one :timeline_item, as: :owner

  after_create :create_timeline_item

  def create_timeline_item
    create_timeline_item!(content: content)
  end
end
