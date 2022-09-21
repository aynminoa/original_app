class Spot < ApplicationRecord
  belongs_to :album
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  #ActiveStorage
  has_many_attached :images

  enum category: { 食事: 0, スイーツ: 1, その他: 2 }
end
