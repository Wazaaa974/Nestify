require 'uri'
require 'net/http'

class GetProductsService
  def initialize(attr = {})
    @search = attr[:search]
    @product_category = attr[:product_category]
    @style = attr[:style]
    @room = attr[:room]
  end

  def call
    search_by_keyword
  end

  private


  def search_by_keyword
    url = URI("https://real-time-product-search.p.rapidapi.com/search-v2?q=#{@search}&country=fr&language=en&page=1&limit=10&sort_by=BEST_MATCH&product_condition=ANY&stores=Ikea%2C%20Maisons%20du%20Monde")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = ENV['REALTIME_PRODUCT_API_KEY']
    request["x-rapidapi-host"] = 'real-time-product-search.p.rapidapi.com'

    response = http.request(request)
    products = JSON.parse(response.body)
    products["data"]["products"].each do |product_data|
      next if Product.find_by(google_shopping_id: product_data['product_id']).present?
      
      product = Product.new(
                  name: product_data["product_title"],
                  description: product_data["product_description"],
                  price: product_data.dig("offer", "price")&.gsub("$", "")&.to_f || 0,
                  url: product_data["product_page_url"],
                  shop: product_data["offer"]["store_name"],
                  google_shopping_id: product_data['product_id'],
                  product_category: @product_category,
                  style: @style,
                  room: @room
                )

      if product.save
        photo_url = product_data["product_photos"].first
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
