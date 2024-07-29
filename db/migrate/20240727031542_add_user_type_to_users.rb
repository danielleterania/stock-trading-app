# db/migrate/TIMESTAMP_add_user_type_to_users.rb

class AddUserTypeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_type, :string
    add_index :users, :user_type
  end
end
