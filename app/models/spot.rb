class Spot < ApplicationRecord
  belongs_to :album
  has_many :spot_tags, dependent: :destroy
  has_many :tags, through: :spot_tags
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  #ActiveStorage
  has_many_attached :images

  validates :name, presence: true, length: { maximum: 60 }
  validates :address, presence: true
  validates :category, presence: true
  validates :comment, length: { maximum: 200 }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum category: { 食事: 0, スイーツ: 1, 食事＆スイーツ:2, カフェ: 3, その他: 4 }
end
