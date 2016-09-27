class Article < ApplicationRecord
	validates :title, presence: true, dependent: :destroy
	validates :content, presence: true, length: { minimum: 5 }
end
