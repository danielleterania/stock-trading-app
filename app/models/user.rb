# app/models/user.rb

class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Validations
  # validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  # validates :user_type, inclusion: { in: %w[admin trader] }

  # Method to check if the user is an admin
  def admin?
    user_type == 'admin'
  end

  # Method to check if the user is a trader
  def trader?
    user_type == 'trader'
  end
end
  