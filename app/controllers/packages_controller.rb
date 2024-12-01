class PackagesController < ApplicationController
  def index
    # @packages = Package.all
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
    # @package = Package.find(params[:id])
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
    params.require(:package).permit(:name, :budget, :min, :max)
  end
end
