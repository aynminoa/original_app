class AddPublishedToAlbum < ActiveRecord::Migration[6.1]
  def change
    add_column :albums, :published, :boolean, default: true, null: false
  end
end
