class TimelineItem < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
