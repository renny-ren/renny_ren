class Comment < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
