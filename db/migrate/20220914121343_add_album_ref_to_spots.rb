class AddAlbumRefToSpots < ActiveRecord::Migration[6.1]
  def change
    add_reference :spots, :album, null: false, foreign_key: true
  end
end
