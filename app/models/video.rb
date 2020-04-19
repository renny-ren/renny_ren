class Video < ApplicationRecord
  has_many :comments, as: :owner, dependent: :destroy
end
