# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Movie.destroy_all

# 10.times do
# Movie.create(title: Faker::Movie.title, overview: Faker::ChuckNorris.fact, poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: rand(5..10))
# end

# puts 'Seeds Done'
require 'open-uri'
require 'json'

Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated'

# Populates Movie DB with top rated movie from API
doc = JSON.parse(URI.open(url).read)
doc['results'].each do |m|
  Movie.create(title: m['title'], overview: m['overview'], poster_url: "https://image.tmdb.org/t/p/w500#{m['poster_path']}", rating: m['vote_average'])
end

puts 'Seeds Done'
