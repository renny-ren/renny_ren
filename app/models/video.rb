class Video < ApplicationRecord
  include Redis::Objects

  acts_as_taggable

  has_many :comments, as: :owner, dependent: :destroy

  counter :view_times

  scope :search_filter, -> (query) { where('title LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%") }
end
