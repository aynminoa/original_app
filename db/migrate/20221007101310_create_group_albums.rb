class CreateGroupAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :group_albums do |t|
      t.references :album, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
