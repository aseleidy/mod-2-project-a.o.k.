# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Destination.destroy_all

Destination.create(city: "New York", country: "United States", likes: rand(100))
Destination.create(city: "Chicago", country: "United States", likes: rand(100))
Destination.create(city: "Miami", country: "United States", likes: rand(100))
Destination.create(city: "Los Angeles", country: "United States", likes: rand(100))
Destination.create(city: "Orlando", country: "United States", likes: rand(100))
Destination.create(city: "Boston", country: "United States", likes: rand(100))
Destination.create(city: "Cartagena", country: "Colombia", likes: rand(100))
Destination.create(city: "Paris", country: "France", likes: rand(100))
Destination.create(city: "Madrid", country: "Spain", likes: rand(100))
Destination.create(city: "Rome", country: "Italy", likes: rand(100))
Destination.create(city: "Buenos Aires", country: "Argentina", likes: rand(100))




def populate_places
    place_names = ["The Frozen Hearth", "Sleeping Giant Inn", "The Drunken Huntsman", "The Bannered Mare", "Old Hroldan Inn", "The Bee And Barb", "Lucky 38", "The Tops", "Brotherhood of Steel Safehouse", "Dino Dee-lite Motel"]
    url_array = ["", "www.google.com"]
    category_array = ["attraction", "bar", "restaurant", "other"]
    img_url_array = ["https://upload.wikimedia.org/wikipedia/commons/c/c3/AA78_by_Zdzislaw_Beksinski_1978.jpg", "https://giordanos.com/wp-content/uploads/Hero-image_1210-v2.jpg", "https://cdn.choosechicago.com/uploads/2019/05/bean_dawn_5d5624c9-38bc-42c6-a0bc-3b84be7dca9b.jpg", "https://cdn.cnn.com/cnnnext/dam/assets/170606121035-greece---travel-destination---shutterstock-560829934.jpg", "https://cdn.vox-cdn.com/thumbor/4xm9IPCjtYVBOkY7eykQVO8_Kgk=/0x0:1648x1099/1820x1213/filters:focal(693x419:955x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/60077045/girl_goat_facebook.0.jpg"]
    Place.create!(name: place_names.sample, category: category_array.sample, url: url_array.sample, img_url: img_url_array.sample, destination_id: Destination.ids.sample)
end

# t.string :name
# t.string :category
# t.string :url
# t.string :img_url
# t.integer :destination_id


def populate_comments
    statements = ["This is a good place.", "This place is terrible.", "This place gave me food poisoning.", "I demanded to see the manager SIX TIMES.", "I love this place!", "There is no god but there are three hells. You don't have to worry about the first two. You are going to the third. The third is this place.", "This is the best restaurant in the universe.", "the pizza was ok."]
    Comment.create!(place_id: Place.ids.sample, content: statements.sample, user_id: 1)
end

# t.text :content
# t.integer :place_id
# t.integer :user_id

100.times do populate_places
end
500.times do populate_comments
end