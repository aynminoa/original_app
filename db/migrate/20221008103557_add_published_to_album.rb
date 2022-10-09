class AddPublishedToAlbum < ActiveRecord::Migration[6.1]
  def change
    add_column :albums, :published, :boolean, default: false, null: false
  end
end
