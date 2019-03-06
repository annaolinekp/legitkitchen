# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Recipe.destroy_all
User.destroy_all
Country.destroy_all
Ingredient.destroy_all

dietary_requirements = ["Appetiser", "Main", "Drinks", "Dessert"]
categories = ["Vegetarian", "Vegan", "Lactose Intolerant","Gluten Free", "Halal"]

puts 'Creating 10 fake users...'

10.times do
  user = User.new(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.unique.email,
    password: "123456",
    # profile_picture_url: "res.cloudinary.com/do6brpyuo/image/upload/v1551872540/lism2u71mmxu0ichi4bw.jpg"

  )
  user.save!

puts 'Creating 2 fake recipes...'
  2.times do
    recipe = Recipe.new(
      name: Faker::Food.unique.dish,
      description: Faker::Food.description,
      # category: Faker::Nation.nationality,
      cooktime: "15min",
      preptime: "30min",
      # picture_url: "res.cloudinary.com/do6brpyuo/image/upload/v1551872540/lism2u71mmxu0ichi4bw.jpg",
      user: user,
      dietary_requirements: dietary_requirements.sample,
      category: categories.sample

    )
    recipe.save!
  end
end

puts 'Seeding countries...'
50.times do
  country = Country.new(
    name: Faker::Address.unique.country
  )
  country.save!
end

puts 'Creating 30 fake ingredients...'
    30.times do
  ingredient = Ingredient.new(
    name: Faker::Food.ingredient
  )
  ingredient.save!
end

puts "Finished!"


