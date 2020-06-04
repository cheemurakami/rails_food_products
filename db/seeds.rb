# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all



50.times do 
  product = Product.create!(name: Faker::Food.fruits, cost: Faker::Number.decimal(l_digits: 1), country_of_origin: Faker::Address.country)
  5.times do
    Review.create!(author: Faker::TvShows::SouthPark.character , content_body: Faker::Lorem.characters(number: 50..250), product: product, rating:Faker::Number.between(from: 1, to: 5))
  end
end