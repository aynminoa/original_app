class Spot < ApplicationRecord
  belongs_to :album
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_one :category, dependent: :destroy
  #ActiveStorage
  has_many_attached :images
end
