require 'uri'
require 'net/http'
require 'json'

class GetProductsService
  def initialize(room_styles_products)
    @room_styles_products = room_styles_products
  end

  def call
    get_products_data
  end

  def parse_json_data
    file_path = "app/data/products.json"
    product_json = File.read(file_path)
    products_data = JSON.parse(product_json)

    products_data.each do |room_key, room_styles|
      room_styles.each do |style_key, products|
        products.each do |product_hash|
          product_category = ProductCategory.find_by(name: product_hash["product_category"])
          style = Style.find_by(name: product_hash["style"])
          room = Room.find_by(name: room_key.to_s)

          product_hash["product_infos"]["products"].each do |product_data|
            next if Product.find_by(google_shopping_id: product_data['product_id']).present?

            product = Product.new(
                        name: product_data["product_title"],
                        description: product_data["product_description"],
                        price: product_data.dig("offer", "price")&.gsub("$", "")&.to_f || 0,
                        url: product_data["offer"]["offer_page_url"],
                        shop: product_data["offer"]["store_name"],
                        google_shopping_id: product_data['product_id'],
                        product_category: product_category,
                        style: style,
                        room: room
                      )

            if product.save
              photo_url = product_data["product_photos"].last
              downloaded_photo = URI.open(photo_url)
              product.photo.attach(
                io: downloaded_photo,
                filename: "#{product.name.parameterize}.jpg",
                content_type: 'image/jpeg'
              )
            end
          end
        end
      end
    end
  end

  private

  def get_products_data
    @room_styles_products.each do |room_key, room_styles|
      room_styles.each do |style_key, products|
        products.each do |product_hash|
          product_category = product_hash[:product_category]
          style = product_hash[:style]
          room_name = room_key.to_s

          search = "#{product_category} #{room_name} #{style}"

          response = search_by_keyword(search.parameterize)
          product_hash[:product_infos] = response
        end
      end
    end

    room_json = JSON.pretty_generate(@room_styles_products)
    File.write('app/data/products.json', room_json)
  end

  def search_by_keyword(search)
    url = URI("https://real-time-product-search.p.rapidapi.com/search-v2?q=#{search}&country=fr&language=en&page=1&limit=3&sort_by=BEST_MATCH&product_condition=ANY&stores=Ikea%2C%20Maisons%20du%20Monde")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = ENV['REALTIME_PRODUCT_API_KEY']
    request["x-rapidapi-host"] = 'real-time-product-search.p.rapidapi.com'

    JSON.parse(http.request(request).body).dig('data')
  end
end
