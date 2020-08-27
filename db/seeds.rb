# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BillingPlan.destroy_all
Category.destroy_all
Subscription.destroy_all

puts "Creating billing plans..."

BillingPlan.create(name: "Free trial")
BillingPlan.create(name: "Weekly")
BillingPlan.create(name: "Monthly")
BillingPlan.create(name: "3 months")
BillingPlan.create(name: "12 months")
BillingPlan.create(name: "24 months")
BillingPlan.create(name: "Lifetime")

 puts "Creating categories..."

Category.create(name: "Entertainment")
Category.create(name: "Cloud storage")
Category.create(name: "Software")
Category.create(name: "Food and drink")
Category.create(name: "Beauty")
Category.create(name: "Phone")
Category.create(name: "Health")
Category.create(name: "Utilities")

puts "Creating subscriptions..."

# Subscription.create(
#   name: "Netflix - Basic",
#   description: "Unlimited films, TV programmes and more. Watch anywhere. Cancel at any time.",
#   price: 5.99,
#   category_id: 
# )

puts "Finished!"
