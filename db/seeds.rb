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

ProductPackage.destroy_all
Product.destroy_all
Proposal.destroy_all
Package.destroy_all
Style.destroy_all
Room.destroy_all
User.destroy_all

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
# classic = Style.create!(name: "classic")
# contemporain = Style.create!(name: "contemporain")
industriel = Style.create!(name: "industriel")
vintage = Style.create!(name: "vintage")
# classic_chic = Style.create!(name: "classic_chic")
# bord_de_mer = Style.create!(name: "bord_de_mer")
# tropical = Style.create!(name: "tropical")
# campagne = Style.create!(name: "campagne")
# minimaliste = Style.create!(name: "minimaliste")
scandinave = Style.create!(name: "scandinave")
boheme = Style.create!(name: "boheme")
# zen_asiatique = Style.create!(name: "zen_asiatique")
# antique = Style.create!(name: "antique")
# baroque = Style.create!(name: "baroque")

# Rooms
living_room = Room.create!(name: "Living Room")
bedroom = Room.create!(name: "Bedroom")


# Product Categories
lit = ProductCategory.create!(name: "lit")
table_chevet = ProductCategory.create!(name: "table_chevet")
armoire = ProductCategory.create!(name: "armoire")
tapis = ProductCategory.create!(name: "tapis")
miroir = ProductCategory.create!(name: "miroir")
decor = ProductCategory.create!(name: "Decor")

# puts "#{row['name']} #{row['description']} #{row['price']}"

# Products
filepath = "lit_chambre_style.csv"
CSV.foreach(filepath, headers: :first_row, col_sep: ";") do |row|
  style = Style.find_by(name: row['style'])
  style = modern if style.nil?
  Product.create!(
  name: "#{row['name']}",
  description: "#{row['description']}",
  price: row['price'].to_f,
  url: "#{row['url']}",
  shop: "#{row['shop']}",
  product_category_id: lit.id,
  style_id: style.id,
  room_id: bedroom.id
)
end

# sofa = Product.create!(
#   name: "Comfy Sofa",
#   description: "A modern and comfortable sofa.",
#   price: 499.99,
#   url: "http://example.com/sofa",
#   shop: "Furniture Store",
#   product_category_id: decor.id,
#   style_id: modern.id,
#   room_id: living_room.id
# )

# lamp = Product.create!(
#   name: "Stylish Lamp",
#   description: "A stylish lamp for your bedroom.",
#   price: 79.99,
#   url: "http://example.com/lamp",
#   shop: "Lighting Store",
#   product_category_id: decor.id,
#   style_id: classic.id,
#   room_id: bedroom.id
# )


filepath = "table_chambre_style.csv"
CSV.foreach(filepath, headers: :first_row, col_sep: ';') do |row|
  style = Style.find_by(name: row['style'])
  style = modern if style.nil?
  Product.create!(
  name: "#{row['name']}",
  description: "#{row['description']}",
  price: row['price'].to_f,
  url: "#{row['url']}",
  shop: "#{row['shop']}",
  product_category_id: table_chevet.id,
  style_id: style.id,
  room_id: bedroom.id
)
end

filepath = "armoire_chambre_style.csv"
CSV.foreach(filepath, headers: :first_row, col_sep: ';') do |row|
  style = Style.find_by(name: row['style'])
  style = modern if style.nil?
  Product.create!(
  name: "#{row['name']}",
  description: "#{row['description']}",
  price: row['price'].to_f,
  url: "#{row['url']}",
  shop: "#{row['shop']}",
  product_category_id: armoire.id,
  style_id: style.id,
  room_id: bedroom.id
)
end


filepath = "tapis_chambre_style.csv"
CSV.foreach(filepath, headers: :first_row, col_sep: ';') do |row|
  style = Style.find_by(name: row['style'])
  style = modern if style.nil?
  Product.create!(
  name: "#{row['name']}",
  description: "#{row['description']}",
  price: row['price'].to_f,
  url: "#{row['url']}",
  shop: "#{row['shop']}",
  product_category_id: tapis.id,
  style_id: style.id,
  room_id: bedroom.id
)
end

filepath = "miroir_chambre_style.csv"
CSV.foreach(filepath, headers: :first_row, col_sep: ';') do |row|
  style = Style.find_by(name: row['style'])
  style = modern if style.nil?
  Product.create!(
  name: "#{row['name']}",
  description: "#{row['description']}",
  price: row['price'].to_f,
  url: "#{row['url']}",
  shop: "#{row['shop']}",
  product_category_id: miroir.id,
  style_id: style.id,
  room_id: bedroom.id
)
end


# Packages
package_modern = Package.create!(
  name: "Modern Bedroom Package",
  budget: 1000.0,
  min: 800.0,
  max: 1200.0,
  room_id: bedroom.id,
  style_id: modern.id
)

package_vintage = Package.create!(
  name: "Vintage Bedroom Package",
  budget: 1000.0,
  min: 800.0,
  max: 1200.0,
  room_id: bedroom.id,
  style_id: vintage.id
)










lit_moderne = Product.find_by(style: modern, room: bedroom, product_category: lit)
table_chevet_moderne = Product.find_by(style: modern, room: bedroom, product_category: table_chevet)
armoire_moderne = Product.find_by(style: modern, room: bedroom, product_category: armoire)
tapis_moderne = Product.find_by(style: modern, room: bedroom, product_category: tapis)
miroir_moderne = Product.find_by(style: modern, room: bedroom, product_category: miroir)



lit_vintage = Product.find_by(style: vintage, room: bedroom, product_category: lit)
table_chevet_vintage = Product.find_by(style: vintage, room: bedroom, product_category: table_chevet)
armoire_vintage = Product.find_by(style: vintage, room: bedroom, product_category: armoire)
tapis_vintage = Product.find_by(style: vintage, room: bedroom, product_category: tapis)
miroir_vintage = Product.find_by(style: vintage, room: bedroom, product_category: miroir)


# Product Packages
product_package_modern_lit = ProductPackage.create!(product: lit_moderne , package_id: package_modern.id)
product_package_modern_table_chevet = ProductPackage.create!(product: table_chevet_moderne, package_id: package_modern.id)
product_package_modern_armoire = ProductPackage.create!(product: armoire_moderne, package_id: package_modern.id)
product_package_modern_tapis = ProductPackage.create!(product: tapis_moderne, package_id: package_modern.id)
product_package_modern_miroir = ProductPackage.create!(product: miroir_moderne, package_id: package_modern.id)

product_package_vintage_lit = ProductPackage.create!(product: lit_vintage , package_id: package_vintage.id)
product_package_vintage_table_chevet = ProductPackage.create!(product: table_chevet_vintage, package_id: package_vintage.id)
product_package_vintage_armoire = ProductPackage.create!(product: armoire_vintage, package_id: package_vintage.id)
product_package_vintage_tapis = ProductPackage.create!(product: tapis_vintage, package_id: package_vintage.id)
product_package_vintage_miroir = ProductPackage.create!(product: miroir_vintage, package_id: package_vintage.id)



# Favorites
proposal1 = Proposal.create!(user_id: user1.id, package_id: package_modern.id, favorite: true)
proposal2 = Proposal.create!(user_id: user2.id, package_id: package_vintage.id, favorite: true)


# Rooms
living_room = Room.create!(name: "salon")
bedroom = Room.create!(name: "chambre")



# Product Categories

# Chambre
lit = ProductCategory.create!(name: "lit")
table_chevet = ProductCategory.create!(name: "table chevet")
armoire = ProductCategory.create!(name: "armoire")
tapis = ProductCategory.create!(name: "tapis")
tableau = ProductCategory.create!(name: "tableau")

# Salon
canape = ProductCategory.create!(name: "canape")
fauteuil = ProductCategory.create!(name: "fauteuil")
table_basse = ProductCategory.create!(name: "table basse")
meuble_tv = ProductCategory.create!(name: "meuble TV")
bibliotheque = ProductCategory.create!(name: "bibliotheque")
tapis_salon = ProductCategory.create!(name: "tapis")


# Salle de bain
meuble_vasque = ProductCategory.create!(name: "meuble vasque")
armoire_toilette = ProductCategory.create!(name: "armoire de toilette")
porte_serviette = ProductCategory.create!(name: "porte-serviette")
panier_linge = ProductCategory.create!(name: "panier à linge")
tapis_bain = ProductCategory.create!(name: "tapis de bain")

ROOM_STYLES_PRODUCTS = {
 salon: {
   moderne: [
     { product_category: canape, style: modern },
     { product_category: fauteuil, style: modern },
     { product_category: table_basse, style: modern },
     { product_category: meuble_tv, style: modern },
     { product_category: bibliotheque, style: modern },
     { product_category: tapis_salon, style: modern }
   ],
   classique: [
     { product_category: canape, style: classic },
     { product_category: fauteuil, style: classic },
     { product_category: table_basse, style: classic },
     { product_category: meuble_tv, style: classic },
     { product_category: bibliotheque, style: classic },
     { product_category: tapis_salon, style: classic }
   ],
   contemporain: [
     { product_category: canape, style: contemporain },
     { product_category: fauteuil, style: contemporain },
     { product_category: table_basse, style: contemporain },
     { product_category: meuble_tv, style: contemporain },
     { product_category: bibliotheque, style: contemporain },
     { product_category: tapis_salon, style: contemporain }
   ]
 },
#  chambre: {
#    moderne: [
#      { product_category: lit, style: modern },
#      { product_category: table_chevet, style: modern },
#      { product_category: armoire, style: modern },
#      { product_category: tapis, style: modern },
#      { product_category: tableau, style: modern }
#    ],
#    classique: [
#      { product_category: lit, style: classic },
#      { product_category: table_chevet, style: classic },
#      { product_category: armoire, style: classic },
#      { product_category: tapis, style: classic },
#      { product_category: tableau, style: classic }
#    ],
#    contemporain: [
#      { product_category: lit, style: contemporain },
#      { product_category: table_chevet, style: contemporain },
#      { product_category: armoire, style: contemporain },
#      { product_category: tapis, style: contemporain },
#      { product_category: tableau, style: contemporain }
#    ]
#  },
#  salle_de_bain: {
#    moderne: [
#      { product_category: meuble_vasque, style: modern },
#      { product_category: armoire_toilette, style: modern },
#      { product_category: porte_serviette, style: modern },
#      { product_category: panier_linge, style: modern },
#      { product_category: tapis_bain, style: modern }
#    ],
#    classique: [
#      { product_category: meuble_vasque, style: classic },
#      { product_category: armoire_toilette, style: classic },
#      { product_category: porte_serviette, style: classic },
#      { product_category: panier_linge, style: classic },
#      { product_category: tapis_bain, style: classic }
#    ],
#    contemporain: [
#      { product_category: meuble_vasque, style: contemporain },
#      { product_category: armoire_toilette, style: contemporain },
#      { product_category: porte_serviette, style: contemporain },
#      { product_category: panier_linge, style: contemporain },
#      { product_category: tapis_bain, style: contemporain }
#    ]
#  }
}

ROOM_STYLES_PRODUCTS.each do |room_key, room_styles|
  room_styles.each do |style_key, products|
    products.each do |product_hash|

      product_category = product_hash[:product_category]
      style = product_hash[:style]
      room_name = room_key.to_s

      search = "#{product_category.name} #{room_name} #{style_key.name}"

      GetProductsService.new(search: search.parameterize, product_category: product_category, style: style, room: Room.find_by(name: room_key.to_s)).call
    end
  end
end











puts "Database seeded successfully!"
