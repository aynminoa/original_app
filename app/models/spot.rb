class Spot < ApplicationRecord
  belongs_to :album
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
