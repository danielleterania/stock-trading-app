# db/seeds.rb

User.create!(
  username: 'adminuser',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  user_type: 'admin'
)
