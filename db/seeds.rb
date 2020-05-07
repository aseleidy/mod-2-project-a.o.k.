# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Destination.destroy_all

Destination.create(city: "New York", country: "United States", likes: 0)
Destination.create(city: "Chicago", country: "United States", likes: 0)
Destination.create(city: "Miami", country: "United States", likes: 0)
Destination.create(city: "Los Angeles", country: "United States", likes: 0)
Destination.create(city: "Orlando", country: "United States", likes: 0)
Destination.create(city: "Boston", country: "United States", likes: 0)
Destination.create(city: "Cartagena", country: "Colombia", likes: 0)
Destination.create(city: "Paris", country: "France", likes: 0)
Destination.create(city: "Madrid", country: "Spain", likes: 0)
Destination.create(city: "Rome", country: "Italy", likes: 0)
Destination.create(city: "Buenos Aires", country: "Argentina", likes: 0)


