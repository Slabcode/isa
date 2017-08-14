class InRuCr < ApplicationRecord
  belongs_to :client
  has_many :image_in_ru_crs
end
