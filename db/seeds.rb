# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

hash_users = Array.new(10) do
  { login: Faker::Name.name }
end
users = User.create! hash_users

hash_posts = Array.new(30) do
  print "."
  {
    title:    Faker::Hipster.sentence,
    body:     Faker::Hipster.paragraph,
    ip:       Faker::Internet.ip_v4_address,
    user_id:  users.sample.id
  }
end

posts = Post.create! hash_posts

hash_rates = posts.map do |post|
  {
    value: rand(1..5),
    post_id: post.id,
  }
end
puts hash_rates
Rate.create! hash_rates
