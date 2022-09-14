class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.date :visited_on
      t.string :url
      t.text :comment

      t.timestamps
    end
  end
end
