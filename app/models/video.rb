class Video < ApplicationRecord
  acts_as_taggable

  has_many :comments, as: :owner, dependent: :destroy
end
