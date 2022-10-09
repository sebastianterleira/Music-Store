# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seed.rb
require 'faker'
# Artists
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
         death_date: Faker::Date.birthday(min_age: 5, max_age: 10) #=> "Fri, 28 Mar 1986"
        ) 

    if artists.save
        puts "Artist created succesfully"
    else
        puts artists.errors.full_messages.join(",")
    end
end

puts "Finish seeding Artists"
# Customers
puts "Start seeding Customers"
15.times do |number| 
    customers = Customer.new(
       username: Faker::FunnyName.unique.two_word_name, #=> "Shirley Knot"
       email: Faker::Internet.email(name: "Customer #{number + 1}"), #=> "nancy@terry.biz"
       password: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true), #=> "3k5qS15aNmG"
       name: Faker::Name.unique.name # This will return a unique name every time it is called
    )
    if customers.save
        puts "Customer created succesfully"
    else
        puts customers.errors.full_messages.join(",")
    end
end

puts "Finish seeding Customers"


def save_data(data,message)
    if data.save
        puts "#{message} created succesfully"
    else
        puts data.errors.full_messages.join(",")
    end
end

# Albums
puts "Start seeding Albums"
id_artist = 1
while id_artist <= Artist.all.size
    rand(2..6).times do |num|
        albums = Album.new(
            name: Faker::Music::RockBand.unique.name, #=> "Led Zeppelin", #=> "Dream On",
            price: rand(1..20),
            artist_id: id_artist,
            duration: 0
        )
        save_data(albums,"Album")
    end
    id_artist += 1
end

puts "Finish seeding Albums"


# Songs
puts "Start seeding Songs"
id_album = 1
while id_album <= Album.all.size
  rand(4..10).times do |num|
    songs = Song.new(
        name: Faker::Music::RockBand.unique.song, #=> "Dream On",
        album_id: Album.all.sample.id,
        duration: rand(20..40)
    )
    save_data(songs,"Song")
  end
  id_album += 1
   Faker::Music::RockBand.unique.clear
end

puts "Finish seeding Songs"

# Orders
# OrderDetail.joins(:order).joins(:album).group(:customer_id, :date).order(:customer_id).sum("price*quantity")
puts "Start seeding Orders"
id_customer = 1
while id_customer <= Customer.all.size
    rand(1..5).times do |num|
        orders = Order.new(
            date: Faker::Date.between(from: '2014-09-23', to: '2022-09-25'), #=> #<Date: 2014-09-24>
            # total_price: OrderDetail.select("SUM(price*quantity)").joins(:order).joins(:album).where("customer_id = ?", id_customer ).group(:customer_id, :date).order(:customer_id),
            # OrderDetail.select("SUM(price*quantity)").joins(:order).joins(:album).where("customer_id = 1").group(:customer_id, :date).order(:customer_id)
            # OrderDetail.joins(:album).where("customer_id = 1").group(:customer_id, :date).order(:customer_id)
            # OrderDetail.joins(:album)
            # select * from order_details od join album as a ON od.album_id = a.id;
            total_price: 1
            # customer_id: id_customer
        )
        save_data(orders,"Order")
    end
    id_customer += 1
end

puts "Finish seeding Orders"

# To DO
# Each order should include between 1 and 4 albums. 
# And the quantity of each album in each order should be between 1 and 3.

id_order = 1
while id_order <= Order.all.size
    rand(1..4).times do |num|
        order_details = OrderDetail.new(
            album_id: Album.all.sample.id,
            order_id: id_order,
            quantity: rand(1..3),
            customer_id: Customer.all.sample.id

        )
        save_data(order_details,"Order_detail")
    end
    id_order += 1
end


# id_cust = 1
# while id_cust <= Customer.all.size
#   sumas = OrderDetail.select("SUM(price*quantity)").joins(:order).joins(:album).where("customer_id = #{id_order}").group(:customer_id, :date).order(:customer_id)
#   cust = OrderDetail.joins(:order).joins(:album).where("customer_id = #{id_order}").group(:customer_id, :date).order(:customer_id)

#   n1m = 0
#   cont = cust.size
#   cont.times do |num|
#     cust[n1m].update(total_price: sumas[n1m])
#     n1m += 1
#   end
#   cust.each{|key,value| }

#   id_cust += 1
# end