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

# ProductPackage.destroy_all
# Product.destroy_all
# Proposal.destroy_all
# Package.destroy_all
# Style.destroy_all
# Room.destroy_all
# User.destroy_all

puts "Seed creation"

# Users
# user1 = User.create!(
#   email: "thomas.alonso93@gmail.com",
#   username: "Wazaaa",
#   age: 31,
#   first_name: "Thomas",
#   last_name: "Alonso",
#   password: "azerty"
# )

# user2 = User.create!(
#   email: "jane.doe@example.com",
#   username: "JaneDoe",
#   age: 28,
#   first_name: "Jane",
#   last_name: "Doe",
#   password: "password123"
# )

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
bathroom = Room.create!(name: "Bathroom")
kitchen = Room.create!(name: "Kitchen")

# Product Categories
lit = ProductCategory.create!(name: "lit")
table_chevet = ProductCategory.create!(name: "table_chevet")
table_basse = ProductCategory.create!(name: "table_basse")
armoire = ProductCategory.create!(name: "armoire")
tapis = ProductCategory.create!(name: "tapis")
miroir = ProductCategory.create!(name: "miroir")
lampe = ProductCategory.create!(name: "lampe")
fauteuil = ProductCategory.create!(name: "fauteuil")
tableau = ProductCategory.create!(name: "teableau")
decor = ProductCategory.create!(name: "Decor")
canape = ProductCategory.create!(name: "canape")


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
  description: "Une jolie chambre moderne pour faire des singeries",
  min: 800.0,
  max: 1200.0,
  room_id: bedroom.id,
  style_id: modern.id
)

package_vintage = Package.create!(
  name: "Vintage Bedroom Package",
  description: "Une jolie chambre pour faire des singeries en vintage",
  min: 800.0,
  max: 1200.0,
  room_id: bedroom.id,
  style_id: vintage.id
)

package_modern_salon = Package.create!(
  name: "Modern Living room Package",
  description: "Une jolie chambre moderne pour faire des singeries",
  min: 800.0,
  max: 1200.0,
  room_id: living_room.id,
  style_id: modern.id
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



# canape_moderne = Product.find_by(style: modern, room: living_room, product_category: canape)
# table_basse_moderne = Product.find_by(style: modern, room: living_room, product_category: table_basse)
# fauteuil_moderne = Product.find_by(style: modern, room: living_room, product_category: fauteuil)
# tableau_moderne = Product.find_by(style: modern, room: living_room, product_category: tableau)
# lampe_moderne = Product.find_by(style: modern, room: living_room, product_category: lampe)



# Product Packages
product_package_modern_lit = ProductPackage.create!(product: lit_moderne , package_id: package_modern.id)
product_package_modern_table_chevet = ProductPackage.create!(product: table_chevet_moderne, package_id: package_modern.id)
product_package_modern_armoire = ProductPackage.create!(product: armoire_moderne, package_id: package_modern.id)
product_package_modern_tapis = ProductPackage.create!(product: tapis_moderne, package_id: package_modern.id)
product_package_modern_miroir = ProductPackage.create!(product: miroir_moderne, package_id: package_modern.id)

product_package_vintage_lit = ProductPackage.create!(product: lit_vintage , package_id: package_vintage.id)
product_package_vintage_table_chevet = ProductPackage.create!(product: table_chevet_vintage, package_id: package_vintage.id)
product_package_vintage_armoire = ProductPackage.create!(product: armoire_vintage, package_id: package_vintage.id)
# product_package_vintage_tapis = ProductPackage.create!(product: tapis_vintage, package_id: package_vintage.id)
product_package_vintage_miroir = ProductPackage.create!(product: miroir_vintage, package_id: package_vintage.id)

# product_package_modern_canape = ProductPackage.create!(product: canape_moderne , package_id: package_modern_salon.id)
# product_package_modern_table_basse = ProductPackage.create!(product: table_basse_moderne, package_id: package_modern_salon.d)
# product_package_modern_fauteuil = ProductPackage.create!(product: fauteuil_moderne, package_id: package_modern_salon.id)
# product_package_modern_tableau = ProductPackage.create!(product: tableau_moderne, package_id: package_modern_salon.id)
# product_package_modern_lampe = ProductPackage.create!(product: lampe_moderne, package_id: package_modern_salon.id)


# Favorites
proposal1 = Proposal.create!(user_id: user1.id, package_id: package_modern.id, favorite: true)
proposal2 = Proposal.create!(user_id: user2.id, package_id: package_vintage.id, favorite: true)


# Rooms
living_room = Room.create!(name: "salon")
bedroom = Room.create!(name: "chambre")




# ---------------------------- Code implemente par Romain ----------------------------

# Product Categories

# Chambre
lit = ProductCategory.create!(name: "lit")
table_chevet = ProductCategory.create!(name: "table chevet")
armoire = ProductCategory.create!(name: "armoire")
tapis_chambre = ProductCategory.create!(name: "tapis chambre")
miroir_chambre = ProductCategory.create!(name: "miroir chambre")


# Salon
canape = ProductCategory.create!(name: "canape")
fauteuil = ProductCategory.create!(name: "fauteuil")
table_basse = ProductCategory.create!(name: "table basse")
tableau = ProductCategory.create!(name: "tableau")
lampe = ProductCategory.create!(name: "lampe")
tapis_salon = ProductCategory.create!(name: "tapis salon")

# Salle de bain
miroir_salle_de_bain = ProductCategory.create!(name: "miroir salle de bain")
armoire_toilette = ProductCategory.create!(name: "armoire de toilette")
porte_serviette = ProductCategory.create!(name: "porte-serviette")
panier_linge = ProductCategory.create!(name: "panier à linge")
tapis_bain = ProductCategory.create!(name: "tapis de bain")


# Cuisine
table_a_manger = ProductCategory.create!(name: "Table a manger")
chaises = ProductCategory.create!(name: "chaises")
vaisselle = ProductCategory.create!(name: "vaisselle")
ustensiles = ProductCategory.create!(name: "ustensiles")
desserte = ProductCategory.create!(name: "desserte")


ROOM_STYLES_PRODUCTS = {
  living_room: {
    moderne: [
      { product_category: canape.name, style: modern.name },
      { product_category: fauteuil.name, style: modern.name },
      { product_category: table_basse.name, style: modern.name },
      { product_category: tableau.name, style: modern.name },
      { product_category: lampe.name, style: modern.name },
      { product_category: tapis_salon.name, style: modern.name }
    ],
    industriel: [
      { product_category: canape.name, style: industriel.name },
      { product_category: fauteuil.name, style: industriel.name },
      { product_category: table_basse.name, style: industriel.name },
      { product_category: tableau.name, style: industriel.name },
      { product_category: lampe.name, style: industriel.name },
      { product_category: tapis_salon.name, style: industriel.name }
    ],
    vintage: [
      { product_category: canape.name, style: vintage.name },
      { product_category: fauteuil.name, style: vintage.name },
      { product_category: table_basse.name, style: vintage.name },
      { product_category: tableau.name, style: vintage.name },
      { product_category: lampe.name, style: vintage.name },
      { product_category: tapis_salon.name, style: vintage.name }
    ],
    scandinave: [
      { product_category: canape.name, style: scandinave.name },
      { product_category: fauteuil.name, style: scandinave.name },
      { product_category: table_basse.name, style: scandinave.name },
      { product_category: tableau.name, style: scandinave.name },
      { product_category: lampe.name, style: scandinave.name },
      { product_category: tapis_salon.name, style: scandinave.name }
    ],
    boheme: [
      { product_category: canape.name, style: boheme.name },
      { product_category: fauteuil.name, style: boheme.name },
      { product_category: table_basse.name, style: boheme.name },
      { product_category: tableau.name, style: boheme.name },
      { product_category: lampe.name, style: boheme.name },
      { product_category: tapis_salon.name, style: boheme.name }
    ]
  },
  bedroom: {
    moderne: [
      { product_category: lit.name, style: modern.name },
      { product_category: table_chevet.name, style: modern.name },
      { product_category: armoire.name, style: modern.name },
      { product_category: tapis.name, style: modern.name },
      { product_category: miroir_chambre.name, style: modern.name }
    ],
    industriel: [
      { product_category: lit.name, style: industriel.name },
      { product_category: table_chevet.name, style: industriel.name },
      { product_category: armoire.name, style: industriel.name },
      { product_category: tapis.name, style: industriel.name },
      { product_category: miroir_chambre.name, style: industriel.name }
    ],
    vintage: [
      { product_category: lit.name, style: vintage.name },
      { product_category: table_chevet.name, style: vintage.name },
      { product_category: armoire.name, style: vintage.name },
      { product_category: tapis.name, style: vintage.name },
      { product_category: miroir_chambre.name, style: vintage.name }
    ],
    scandinave: [
      { product_category: lit.name, style: scandinave.name },
      { product_category: table_chevet.name, style: scandinave.name },
      { product_category: armoire.name, style: scandinave.name },
      { product_category: tapis.name, style: scandinave.name },
      { product_category: miroir_chambre.name, style: scandinave.name }
    ],
    boheme: [
      { product_category: lit.name, style: boheme.name },
      { product_category: table_chevet.name, style: boheme.name },
      { product_category: armoire.name, style: boheme.name },
      { product_category: tapis.name, style: boheme.name },
      { product_category: miroir_chambre.name, style: boheme.name }
    ]
  },
  bathroom: {
    moderne: [
      { product_category: miroir_salle_de_bain.name, style: modern.name },
      { product_category: armoire_toilette.name, style: modern.name },
      { product_category: porte_serviette.name, style: modern.name },
      { product_category: panier_linge.name, style: modern.name },
      { product_category: tapis_bain.name, style: modern.name }
    ],
    industriel: [
      { product_category: miroir_salle_de_bain.name, style: industriel.name },
      { product_category: armoire_toilette.name, style: industriel.name },
      { product_category: porte_serviette.name, style: industriel.name },
      { product_category: panier_linge.name, style: industriel.name },
      { product_category: tapis_bain.name, style: industriel.name }
    ],
    vintage: [
      { product_category: miroir_salle_de_bain.name, style: vintage.name },
      { product_category: armoire_toilette.name, style: vintage.name },
      { product_category: porte_serviette.name, style: vintage.name },
      { product_category: panier_linge.name, style: vintage.name },
      { product_category: tapis_bain.name, style: vintage.name }
    ],
    scandinave: [
      { product_category: miroir_salle_de_bain.name, style: scandinave.name },
      { product_category: armoire_toilette.name, style: scandinave.name },
      { product_category: porte_serviette.name, style: scandinave.name },
      { product_category: panier_linge.name, style: scandinave.name },
      { product_category: tapis_bain.name, style: scandinave.name }
    ],
    boheme: [
      { product_category: miroir_salle_de_bain.name, style: boheme.name },
      { product_category: armoire_toilette.name, style: boheme.name },
      { product_category: porte_serviette.name, style: boheme.name },
      { product_category: panier_linge.name, style: boheme.name },
      { product_category: tapis_bain.name, style: boheme.name }
    ]
  },
  kitchen: {
    moderne: [
      { product_category: table_a_manger.name, style: modern.name },
      { product_category: chaises.name, style: modern.name },
      { product_category: vaisselle.name, style: modern.name },
      { product_category: ustensiles.name, style: modern.name },
      { product_category: desserte.name, style: modern.name }
    ],
    industriel: [
      { product_category: table_a_manger.name, style: industriel.name },
      { product_category: chaises.name, style: industriel.name },
      { product_category: vaisselle.name, style: industriel.name },
      { product_category: ustensiles.name, style: industriel.name },
      { product_category: desserte.name, style: industriel.name }
    ],
    vintage: [
      { product_category: table_a_manger.name, style: vintage.name },
      { product_category: chaises.name, style: vintage.name },
      { product_category: vaisselle.name, style: vintage.name },
      { product_category: ustensiles.name, style: vintage.name },
      { product_category: desserte.name, style: vintage.name }
    ],
    scandinave: [
      { product_category: table_a_manger.name, style: scandinave.name },
      { product_category: chaises.name, style: scandinave.name },
      { product_category: vaisselle.name, style: scandinave.name },
      { product_category: ustensiles.name, style: scandinave.name },
      { product_category: desserte.name, style: scandinave.name }
    ],
    boheme: [
      { product_category: table_a_manger.name, style: boheme.name },
      { product_category: chaises.name, style: boheme.name },
      { product_category: vaisselle.name, style: boheme.name },
      { product_category: ustensiles.name, style: boheme.name },
      { product_category: desserte.name, style: boheme.name }
    ]
  }
}

 #methode pour faire le call api
# GetProductsService.new(ROOM_STYLES_PRODUCTS).call


#methode pour parser et creer des instances de produits
# GetProductsService.new(ROOM_STYLES_PRODUCTS).parse_json_data

room_test = ["salon", "chambre", "salle_de_bain", "cuisine"]
style_test = ["moderne", "industriel", "vintage", "scandinave", "boheme"]

# room_test.each do |room|
#   style_test.each do |style|
#     Package.new(name: xxx, min:0, max:0, room_id: Room.find_by(name: room), style_id: Style.find_by(name: style), description: xx)

#   end
# end

# Define your room and styles
room_name = "chambre"
style_names = ["moderne", "industriel", "vintage", "scandinave", "boheme"]

# Define product categories for the chambre
categories = ["lit", "table chevet", "armoire", "tapis chambre", "miroir chambre"]

# Fetch the Room and Styles from the database
room = Room.find_by(name: room_name)

if room.nil?
  puts "Room with name '#{room_name}' not found. Please ensure it exists in the database."
  exit
end

styles = Style.where(name: style_names)
missing_styles = style_names - styles.pluck(:name)
if missing_styles.any?
  puts "The following styles are missing from the database: #{missing_styles.join(', ')}"
  exit
end

# Fetch products for the specified categories
product_categories = ProductCategory.where(name: categories)
missing_categories = categories - product_categories.pluck(:name)
if missing_categories.any?
  puts "The following product categories are missing: #{missing_categories.join(', ')}"
  exit
end

products_by_category = product_categories.each_with_object({}) do |category, hash|
  hash[category.name] = Product.where(product_category: category)
end

# Ensure we have at least one product per category
categories.each do |category|
  if products_by_category[category].blank?
    puts "No products found for category: #{category}. Please add products for this category."
    exit
  end
end

# Create two packages for each style and associate products
styles.each do |style|
  2.times do |i|
    package = Package.create!(
      name: "Package #{style.name.capitalize} ##{i + 1}",
      description: "A #{style.name} style package for the #{room.name}.",
      budget: rand(100..500), # Replace with your logic for budget
      min: rand(50..100), # Replace with your logic for min
      max: rand(101..200), # Replace with your logic for max
      room: room,
      style: style
    )
    puts "Created package: #{package.name}"

    # Add one random product from each category to the package
    categories.each do |category|
      product = products_by_category[category].sample
      ProductPackage.create!(product: product, package: package)
      puts "Added product '#{product.name}' from category '#{category}' to package '#{package.name}'"
    end
  end
end

puts "All packages and associated products created successfully!"

puts "Seed finalisee avec succes"
