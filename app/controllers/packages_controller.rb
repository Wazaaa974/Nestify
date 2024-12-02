class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def create
    @package = Package.new(package_params)
    @package.save
    redirect_to package_path(@package)
  end

  def new
    @package = Package.new
  end

  def show
    @package = Package.find(params[:id])
      @sum = 0
      @package.products.each do |product|
        @sum = @sum + product.price
      end
  end

  def edit
    @package = Package.find(params[:id])
    @product = Product.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])
    @product = Product.find(params[:id])
     @package.update(package_params)
    redirect_to package_path(@package)
  end

  def destroy
    @product_packages = ProductPackage.find_by(package: params[:id], product_id: params[:product_id])
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to package_path(Package.find(params[:id])), status: :see_other if @product_packages.destroy
  end

  def build_package(min, max, room_user)
    room = Room.find_by(name: room_user)
    Package.new(
      name: "Modern Living Room Package",
      budget: 1000.0,
      min: min,
      max: max,
      room_id: room.id,
      style_id: modern.id
    )

    ProductPackage.new(product_id: sofa.id, package_id: package1.id)
  end

private

  def package_params
    params.require(:package).permit(:id, :name, :budget, :min, :max)
  end
end
