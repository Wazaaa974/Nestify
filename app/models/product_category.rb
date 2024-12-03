class ProductCategory < ApplicationRecord
  has_many :products

  def self.for_salon
    ['canape', 'fauteuil', 'table basse', 'tableau', 'lampe', 'tapis']
  end
end
