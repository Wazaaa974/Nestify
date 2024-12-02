class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :style
  belongs_to :room
  has_many :product_packages

  has_one_attached 
end
