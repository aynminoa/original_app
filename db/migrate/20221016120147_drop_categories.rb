class DropCategories < ActiveRecord::Migration[6.1]
  def change
    drop_table :categories do
    end
  end
end
