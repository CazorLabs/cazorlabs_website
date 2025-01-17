# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "starting to seed the database"
100.times do |iter|
  puts iter
  Article.create(title: Faker::Books::Dune.quote, content: Faker::Movies::VForVendetta.speech, publish_date: Faker::Date.between(from: 3.years.ago, to: Date.today), slug: Faker::Internet.slug(glue: "-"))
end
puts "finished seeding the database"
