class RenameUsernameToNomInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :username, :nom
  end
end
