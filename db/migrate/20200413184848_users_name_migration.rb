class UsersNameMigration < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, default: "Admin"
  end
end
