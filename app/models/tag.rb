class Tag < ApplicationRecord
  def to_param
    tag_name
  end
end
