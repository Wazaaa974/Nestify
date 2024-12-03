class Package < ApplicationRecord
  belongs_to :room
  belongs_to :style
  has_many :proposals, dependent: :destroy
  has_many :product_packages, dependent: :destroy
  has_many :products, through: :product_packages
end
