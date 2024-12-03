class ProductPackage < ApplicationRecord
  belongs_to :product
  belongs_to :package

  after_commit :increase_package_total, only: [:create, :update]
  # after_commit :decrease_package_total, only: [:destroy]

  def increase_package_total
    self.package.update(budget: self.package.budget + self.product.price)
  end

  # def decrease_package_total
  #   self.package.update(budget: self.package.budget - self.product.price)
  # end
end
