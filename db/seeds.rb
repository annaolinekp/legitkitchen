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

  2.times do
    recipe = Recipe.new(
      name: Faker::Food.unique.dish,
      description: Faker::Food.description,
      category: Faker::Nation.nationality,
      cooktime: "15min",
      preptime: "30min",
      # picture_url: "res.cloudinary.com/do6brpyuo/image/upload/v1551872540/lism2u71mmxu0ichi4bw.jpg",
      user: user

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

puts "Finished!"
