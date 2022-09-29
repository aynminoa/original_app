class Spot < ApplicationRecord
  belongs_to :album
  has_many :spot_tags, dependent: :destroy
  has_many :tags, through: :spot_tags
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  #ActiveStorage
  has_many_attached :images

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum category: { 食事: 0, スイーツ: 1, その他: 2 }
end
