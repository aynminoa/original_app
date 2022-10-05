class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :albums, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_spots, through: :favorites, source: :spot
  #ActiveStorage
  has_one_attached :image

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
      user.id = 6
    end
  end

  def self.guest_admin
    find_or_create_by!(email: "guest_admin@example.com") do |user|
      user.name = "管理者ゲスト"
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
      user.id = 5
    end
  end

end
