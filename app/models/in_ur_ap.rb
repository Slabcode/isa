class InUrAp < ApplicationRecord
  belongs_to :client
  has_many :image_in_ur_aps
end
