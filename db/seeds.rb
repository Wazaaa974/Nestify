require "csv"



puts "Destroying current database records..."
# Uncomment these lines if needed to clear your database
ProductPackage.destroy_all
Product.destroy_all
Proposal.destroy_all
Package.destroy_all
ProductCategory.destroy_all
Style.destroy_all
Room.destroy_all
# User.destroy_all


# Styles
styles = ["modern", "industriel", "vintage", "scandinave", "boheme"].map do |style_name|
  Style.find_or_create_by!(name: style_name)
end


modern = Style.find_by(name: "modern")
industriel = Style.find_by(name: "industriel")
vintage = Style.find_by(name: "vintage")
scandinave = Style.find_by(name: "scandinave")
boheme = Style.find_by(name: "boheme")




lit = ProductCategory.create!(name: "lit")
table_chevet = ProductCategory.create!(name: "table chevet")
armoire = ProductCategory.create!(name: "armoire")
tapis = ProductCategory.create!(name: "tapis")
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

#room
rooms = ["Living Room", "Bedroom", "Bathroom", "Kitchen"].map do |room_name|
  Room.find_or_create_by!(name: room_name)
end

ROOM_STYLES_PRODUCTS = {
  living_room: {
    modern: [
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
    modern: [
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
    modern: [
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
    modern: [
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


GetProductsService.new(ROOM_STYLES_PRODUCTS).parse_json_data





puts "Creating seeds..."


#  Product Categories
# product_categories = [
#   "lit", "table chevet", "armoire", "tapis chambre", "miroir chambre",
#   "canape", "fauteuil", "table basse", "tableau", "lampe", "tapis salon",
#   "miroir salle de bain", "armoire de toilette", "porte-serviette", "panier à linge", "tapis de bain",
#   "table a manger", "chaises", "vaisselle", "ustensiles", "desserte"
# ].map { |category_name| ProductCategory.find_or_create_by!(name: category_name) }


product_categories_bedroom = ["lit", "table chevet", "armoire", "tapis chambre", "miroir chambre"]
product_categories_living_room = ["canape", "fauteuil", "table basse", "tableau", "lampe", "tapis salon"]
product_categories_bathroom = ["miroir salle de bain", "armoire de toilette", "porte-serviette", "panier à linge", "tapis de bain"]
product_categories_kitchen = ["table a manger", "chaises", "vaisselle", "ustensiles", "desserte"]

product_categories_all = [product_categories_living_room, product_categories_bedroom, product_categories_bathroom, product_categories_kitchen]


styles.each do |style|
  rooms.each do |room|
    package = Package.create!(
      name: "Package #{style.name.capitalize}",
      description: "A #{style.name} style package for the #{room.name}.",
      min: rand(50..100),
      max: rand(101..200),
      room: room,
      style: style
    )
    product_categories_all.each do |product_categories_room|
      product_categories_room.each do |category|
        product_category = ProductCategory.where(name: category).first
        product = Product.where(product_category: product_category, room: room)&.sample
        ProductPackage.create!(product: product , package: package) unless product.nil?
      end
    end
  end
end

puts "Seeding completed successfully!"
