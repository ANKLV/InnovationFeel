class RemoveNameFromAdmins < ActiveRecord::Migration[6.1]
  def up
    remove_column :admins, :name
  end

  def down
    add_column :admins, :name, :string
  end
end
