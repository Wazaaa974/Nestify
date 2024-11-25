class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :style
  belongs_to :room
end
