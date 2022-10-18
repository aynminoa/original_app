class Album < ApplicationRecord
  has_many :spots, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { maximum: 15 }
  validates :visited_on, presence: true

  scope :published, -> { where(published: true) }

end
