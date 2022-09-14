class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :self_introduction, :string
    add_column :users, :image, :string
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
