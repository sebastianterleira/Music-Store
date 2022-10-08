# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seed.rb
require 'faker'

puts "Start seeding Artists"
puts "Artist with only birth_date"
  8.times do |number|
     artists = Artist.new(
      name: Faker::Name.unique.name, # This will return a unique name every time it is called
      nationality: Faker::Nation.nationality, #=> "Nepalese"
      birth_date: Faker::Date.birthday(min_age: 18, max_age: 65), #=> "Fri, 28 Mar 1986"
     ) 

  if artists.save
    puts "Artist created succesfully"
  else
    puts artists.errors.full_messages.join(",")
  end
end

puts "Artist with death_date"

2.times do
        artists = Artist.new(
         name: Faker::Name.unique.name, # This will return a unique name every time it is called
         nationality: Faker::Nation.nationality, #=> "Nepalese"
         birth_date: Faker::Date.birthday(min_age: 18, max_age: 65), #=> "Fri, 28 Mar 1986"
         death_date: Faker::Date.birthday(min_age: 30, max_age: 90) #=> "Fri, 28 Mar 1986"
        ) 

    if artists.save
        puts "Artist created succesfully"
    else
        puts artists.errors.full_messages.join(",")
    end
end

puts "Finish seeding Artists"

puts "Start seeding Customers"
puts "Finish seeding Customers"