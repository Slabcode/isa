class AvaluoImage < ApplicationRecord
  belongs_to :avaluo

  mount_uploader :image, AvaluoUploader

  validates_integrity_of :image
  validates_processing_of :image
end
