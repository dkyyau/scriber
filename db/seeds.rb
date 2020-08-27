# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 puts "Creating categories..."

Category.create(name: "TV")
Category.create(name: "Film")
Category.create(name: "Music")
Category.create(name: "Phone bills")
Category.create(name: "Gym membership")
Category.create(name: )

puts "Creating subscriptions..."

Subscription.create!(
  name: "Netflix",
  description: "A movies/tv show streaming service",
  price: 14.99,
  category: Category.first
  )

Subscription.create(
  name: "Spotify",
  description: "A music streaming service",
  price: 10.99,
  category: Category.first
  )

Subscription.create(
  name: "Playstation Now",
  description: "A videogames streaming service",
  price: 7.99,
  category: Category.first
  )

Subscription.create(
  name: "Crunchyroll",
  description: "A anime streaming service",
  price: 4.99,
  category: Category.first
  )

puts "Creating User Subscriptions..."

UserSubscription.create(cost: 4.99, subscription: Subscription.first, user: User.first)



puts "Finished!"
