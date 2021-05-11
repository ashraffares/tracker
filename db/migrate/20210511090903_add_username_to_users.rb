class AddUsernameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user, :string
    add_index :users, :user, unique: true
  end
end
