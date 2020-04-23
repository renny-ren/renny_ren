class Video < ApplicationRecord
  acts_as_taggable

  has_many :comments, as: :owner, dependent: :destroy

  scope :search_filter, -> (query) { where('title LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%") }
end
