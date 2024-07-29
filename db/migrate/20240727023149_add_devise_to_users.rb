# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def up
    change_table :users do |t|
      # Add columns only if they do not already exist
      unless column_exists?(:users, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      unless column_exists?(:users, :reset_password_token)
        t.string :reset_password_token
      end

      unless column_exists?(:users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      unless column_exists?(:users, :remember_created_at)
        t.datetime :remember_created_at
      end

      # Add indexes if not already present
      add_index :users, :email, unique: true unless index_exists?(:users, :email)
      add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    end
  end

  def down
    change_table :users do |t|
      remove_index :users, :email if index_exists?(:users, :email)
      remove_index :users, :reset_password_token if index_exists?(:users, :reset_password_token)

      t.remove :encrypted_password
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :remember_created_at
    end
  end
end
