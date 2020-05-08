# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Destination.destroy_all
Place.destroy_all
Comment.destroy_all
#User.destroy_all
Itinerary.destroy_all
ItineraryPlace.destroy_all
UserItinerary.destroy_all


Destination.create(city: "New York", country: "United States", likes: rand(1000))
Destination.create(city: "Chicago", country: "United States", likes: rand(1000))
Destination.create(city: "Miami", country: "United States", likes: rand(1000))
Destination.create(city: "Los Angeles", country: "United States", likes: rand(1000))
Destination.create(city: "Orlando", country: "United States", likes: rand(1000))
Destination.create(city: "Boston", country: "United States", likes: rand(1000))
Destination.create(city: "Cartagena", country: "Colombia", likes: rand(1000))
Destination.create(city: "Paris", country: "France", likes: rand(1000))
Destination.create(city: "Madrid", country: "Spain", likes: rand(1000))
Destination.create(city: "Rome", country: "Italy", likes: rand(1000))
Destination.create(city: "Buenos Aires", country: "Argentina", likes: rand(1000))




def populate_places
    place_names = ["The Frozen Hearth", "Sleeping Giant Inn", "The Drunken Huntsman", "The Bannered Mare", "Old Hroldan Inn", "The Bee And Barb", "Lucky 38", "The Tops", "Brotherhood of Steel Safehouse", "Dino Dee-lite Motel"]
    url_array = ["test"]
    category_array = ["attraction", "bar", "restaurant", "other"]
    img_url_array = ["https://upload.wikimedia.org/wikipedia/commons/3/30/Jubilee_and_Munin%2C_Ravens%2C_Tower_of_London_2016-04-30.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Lake_Bondhus_Norway_2862.jpg/2880px-Lake_Bondhus_Norway_2862.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Mostar_Old_Town_Panorama_2007.jpg/480px-Mostar_Old_Town_Panorama_2007.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Sikh_pilgrim_at_the_Golden_Temple_%28Harmandir_Sahib%29_in_Amritsar%2C_India.jpg/2880px-Sikh_pilgrim_at_the_Golden_Temple_%28Harmandir_Sahib%29_in_Amritsar%2C_India.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Locomotives-Roundhouse2.jpg/2560px-Locomotives-Roundhouse2.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Broadway_tower_edit.jpg/480px-Broadway_tower_edit.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/New_York_City_at_night_HDR.jpg/2880px-New_York_City_at_night_HDR.jpg", "https://upload.wikimedia.org/wikipedia/commons/c/c3/AA78_by_Zdzislaw_Beksinski_1978.jpg", "https://giordanos.com/wp-content/uploads/Hero-image_1210-v2.jpg", "https://cdn.choosechicago.com/uploads/2019/05/bean_dawn_5d5624c9-38bc-42c6-a0bc-3b84be7dca9b.jpg", "https://cdn.cnn.com/cnnnext/dam/assets/170606121035-greece---travel-destination---shutterstock-560829934.jpg", "https://cdn.vox-cdn.com/thumbor/4xm9IPCjtYVBOkY7eykQVO8_Kgk=/0x0:1648x1099/1820x1213/filters:focal(693x419:955x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/60077045/girl_goat_facebook.0.jpg"]
    Place.create!(name: "#{place_names.sample}#{Place.all.count}", category: category_array.sample, url: "www.test#{Place.all.count}.com", img_url: img_url_array.sample, destination_id: Destination.ids.sample, likes: rand(1000))
end

# t.string :name
# t.string :category
# t.string :url
# t.string :img_url
# t.integer :destination_id


def populate_comments
    statements = ["This is a good place.", "This place is terrible.", "This place gave me food poisoning.", "I demanded to see the manager SIX TIMES.", "I love this place!", "There is no god but there are three Hells. You don't have to worry about the first two, you will never see them. You are going to the third. The third is this restaurant.", "This is the best restaurant in the universe.", "the pizza was ok.", "Happiness! Free! For everyone! And let no one be forgotten.", "Goodness. You have to make it out of badness, because there's nothing else to make it from. Anyway the food here is good."]
    Comment.create!(place_id: Place.ids.sample, content: statements.sample, user_id: User.ids.sample)
end

# t.text :content
# t.integer :place_id
# t.integer :user_id


def populate_users
    name_array = ["Ashley", "Kyle", "Owen", "Duke", "Jess", "Bart", "David", "Haley", "Isaac", "Ivan", "Johnathan", "Joe", "Julian", "Mack", "Sam G", "Sam E", "Yann", "Claude", "Derek", "Stefani", "Joanna"]
    User.create!(username: "#{name_array.sample}#{User.all.count}", first_name: "Botty", last_name: "McRealperson", email: "bot#{User.all.count}@gmail.com", password: "Password")
end
# t.string :username
# t.string :first_name
# t.string :last_name
# t.string :email
# t.string :password_digest


def populate_itineraries
    title_array = ["Roadside Picnic", "Weekend with the fam", "Ashley's Birthday Bash", "The House Always Wins",  "Sightseeing adventure"]
    Itinerary.create!(title: title_array.sample, destination_id: Destination.ids.sample, likes: rand(10))
end

# t.string :title
# t.integer :destination_id

def populate_itinerary_places
    ItineraryPlace.create!(itinerary_id: Itinerary.ids.sample, place_id: Place.ids.sample)
end
# t.integer :itinerary_id
# t.integer :place_id

def populate_user_itineraries 
    UserItinerary.create!(user_id: User.ids.sample, itinerary_id: Itinerary.ids.sample)
end
# t.integer :user_id
# t.integer :itinerary_id


50.times do populate_users
end
User.all.each do |user|
    user.update!({first_name: user.username.tr("0-9", "")})
end
100.times do populate_places
end
500.times do populate_comments
end
100.times do populate_itineraries 
end
50.times do populate_user_itineraries
end
50.times do populate_itinerary_places 
end