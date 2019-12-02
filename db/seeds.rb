# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  email: 'admin@mail.com',
  password:'password',
  password_confirmation: 'password',
  is_admin: true
)
20.times do |i|
  User.create!(
    email: "test#{i + 1}@example.com",
    password: "password",
    password_confirmation: "password"
  )
end
20.times do |i|
  Genre.create!(
    name: "ジャンル#{i + 1}"
  )
end
20.times do |i|
  Topic.create!(
    genre_id: i / 2 + 1,
    user_id: i + 2,
    name: "トピック#{i + 1}"
  )
end
20.times do |i|
  Post.create!(
    topic_id: i / 4 + 1,
    user_id: i + 2,
    poster_name: "名無し#{i + 1}",
    body: "本文#{i + 1}"
  )
end