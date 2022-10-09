require 'faker'
puts "Start seeding Artists"
puts "Artist with only birth_date"
8.times do |number|
    artists = Artist.new(
        name: Faker::Name.unique.name,
        nationality: Faker::Nation.nationality,
        birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
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
        name: Faker::Name.unique.name,
        nationality: Faker::Nation.nationality,
        birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
        death_date: Faker::Date.birthday(min_age: 5, max_age: 10)
    ) 

    if artists.save
        puts "Artist created succesfully"
    else
        puts artists.errors.full_messages.join(",")
    end
end
puts "Finish seeding Artists"

puts "Start seeding Customers"
15.times do |number| 
    customers = Customer.new(
        username: Faker::FunnyName.unique.two_word_name,
        email: Faker::Internet.email(name: "Customer #{number + 1}"),
        password: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true),
        name: Faker::Name.unique.name
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

puts "Start seeding Albums"
id_artist = 1
while id_artist <= Artist.all.size
    rand(2..6).times do |num|
        albums = Album.new(
            name: Faker::Music::RockBand.unique.name,
            price: rand(1..20),
            artist_id: id_artist,
            duration: 0
        )
        save_data(albums,"Album")
    end
    id_artist += 1
end
puts "Finish seeding Albums"

puts "Start seeding Songs"
id_album = 1
while id_album <= Album.all.size
  rand(4..10).times do |num|
    songs = Song.new(
        name: Faker::Music::RockBand.unique.song,
        album_id: Album.all.sample.id,
        duration: rand(20..40)
    )
    save_data(songs,"Song")
  end
  id_album += 1
   Faker::Music::RockBand.unique.clear
end
puts "Finish seeding Songs"

puts "Start seeding Orders"
id_customer = 1
while id_customer <= Customer.all.size
    rand(1..5).times do |num|
        orders = Order.new(
            date: Faker::Date.between(from: '2014-09-23', to: '2022-09-25'), 
            total_price: 1
        )
        save_data(orders,"Order")
    end
    id_customer += 1
end

puts "Finish seeding Orders"

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
