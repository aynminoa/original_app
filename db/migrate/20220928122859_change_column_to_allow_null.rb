class ChangeColumnToAllowNull < ActiveRecord::Migration[6.1]
  def up
    change_column :spots, :category, :integer, null: true 
  end

  def down
    change_column :spots, :category, :integer, null: false
  end
end