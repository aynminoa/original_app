class Album < ApplicationRecord
  has_many :spots, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :visited_on, presence: true

end
