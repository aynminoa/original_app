class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.date :visited_on

      t.timestamps
    end
  end
end
