# db/seeds.rb

# Create an admin user if it doesn't already exist
unless User.exists?(email: 'admin@example.com')
  User.create!(
    username: 'adminuser',
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password',
    user_type: 'admin'
  )
end

# Create a regular trader user if it doesn't already exist
unless User.exists?(email: 'user@example.com')
  User.create!(
    username: 'regularuser',
    email: 'user@example.com',
    password: 'password',
    password_confirmation: 'password',
    user_type: 'trader'
  )
end
