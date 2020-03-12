class Sentence < ApplicationRecord
  self.per_page = 6

  has_one :timeline_item, as: :owner
end
