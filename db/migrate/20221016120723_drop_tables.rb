class DropTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :group_albums do
    end
    drop_table :group_users do
    end
    drop_table :groups do
    end
  end
end
