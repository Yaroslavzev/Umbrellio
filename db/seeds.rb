# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
require "sequel"
# Sequel.extension :base
hash_users = Array.new(100) do
  { login: Faker::Name.name }
end
users = hash_users.map { |user| User.create(user) }

hash_ips = Array.new(50) do
  { ip: Faker::Internet.ip_v4_address }
end

hash_posts = Array.new(200000) do
  print "."
  {
    title: Faker::Hipster.sentence,
    body: Faker::Hipster.paragraph,
    ip: IPAddr.new(hash_ips.sample[:ip]).to_s,
    user_id: users.sample.id,
  }
end

posts = hash_posts.map { |post| Post.create(post) }
puts "next"

hash_rates = Array.new(50000) do |_post|
  print "."
  {
    value: rand(1..5),
    post_id: posts.sample.id,
  }
end
puts "next"
hash_rates.each { |rate| Rate.create(rate) }
