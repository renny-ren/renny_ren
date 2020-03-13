class TimelineItem < ApplicationRecord
  belongs_to :owner, polymorphic: true

  self.per_page = 10
end
