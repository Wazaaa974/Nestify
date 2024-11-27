# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "csv"

puts "Destruction current database"

User.destroy_all

Style.destroy_all
Room.destroy_all
Product.destroy_all
Package.destroy_all
ProductPackage.destroy_all

puts "Seed creation"

# Users
user1 = User.create!(
  email: "thomas.alonso93@gmail.com",
  username: "Wazaaa",
  age: 31,
  first_name: "Thomas",
  last_name: "Alonso",
  password: "azerty"
)

user2 = User.create!(
  email: "jane.doe@example.com",
  username: "JaneDoe",
  age: 28,
  first_name: "Jane",
  last_name: "Doe",
  password: "password123"
)

# Styles
modern = Style.create!(name: "modern")
classic = Style.create!(name: "classic")

# Rooms
living_room = Room.create!(name: "Living Room")
bedroom = Room.create!(name: "Bedroom")

# Product Categories
furniture = ProductCategory.create!(name: "Furniture")
decor = ProductCategory.create!(name: "Decor")

# Products
filepath = "lit_chambre.csv"
CSV.foreach(filepath, headers: :first_row) do |row|
  puts "#{row['name']} #{row['description']} #{row['price']}"
end


sofa = Product.create!(
  name: "Comfy Sofa",
  description: "A modern and comfortable sofa.",
  price: 499.99,
  url: "http://example.com/sofa",
  shop: "Furniture Store",
  product_category_id: furniture.id,
  style_id: modern.id,
  room_id: living_room.id
)

lamp = Product.create!(
  name: "Stylish Lamp",
  description: "A stylish lamp for your bedroom.",
  price: 79.99,
  url: "http://example.com/lamp",
  shop: "Lighting Store",
  product_category_id: decor.id,
  style_id: classic.id,
  room_id: bedroom.id
)

# Packages
package1 = Package.create!(
  name: "Modern Living Room Package",
  budget: 1000.0,
  min: 800.0,
  max: 1200.0,
  room_id: living_room.id,
  style_id: modern.id
)

# Product Packages
product_package1 = ProductPackage.create!(product_id: sofa.id, package_id: package1.id)

# Favorites
favorite1 = Favorite.create!(user_id: user1.id, package_id: package1.id)
favorite2 = Favorite.create!(user_id: user2.id, package_id: package1.id)

puts "Database seeded successfully!"
