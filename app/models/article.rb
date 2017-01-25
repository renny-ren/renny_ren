class Article < ApplicationRecord
  include FilterExtends
  has_many :comments, dependent: :destroy
  # validates :title, presence: true
  # validates :content, presence: true, length: { minimum: 5 }

  def self.year_month
    Time.now.strftime('%Y-%m') 
  end
end
