class Spot < ApplicationRecord
  belongs_to :album
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  #ActiveStorage
  has_many_attached :images
end
