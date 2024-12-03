class Package < ApplicationRecord
  belongs_to :room
  belongs_to :style
  has_many :proposals
  has_many :product_packages
  has_many :products, through: :product_packages

end
