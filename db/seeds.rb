users = []

5.times do
  users.push User.create!(email: Faker::Internet.email,
                          password: 'password',
                          password_confirmation: 'password')
end

