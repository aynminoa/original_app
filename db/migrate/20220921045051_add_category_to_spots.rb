class AddCategoryToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :category, :integer, null: false
  end
end
