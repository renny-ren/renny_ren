class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 5 }
end
