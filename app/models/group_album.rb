class GroupAlbum < ApplicationRecord
  belongs_to :album
  belongs_to :group
end
