class RemoveCategoryKeyFromSpots < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :spots, :categories
    remove_reference :spots, :category, index: true
  end
end
