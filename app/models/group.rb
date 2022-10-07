class Group < ApplicationRecord
  belongs_to :user
  has_many :group_users

  attr_accessor :invitation_id
end
