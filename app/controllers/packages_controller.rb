class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def create
    @package = Package.new(package_params)
    @package.save
    redirect_to package_path
  end

  def new
    @package = Package.new
  end

  def show
    @package = Package.find(params[:id])
      @sum = 0
      @package.products.each do |product|
        @sum += product.price
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

  def replace_product_package
    @package = Package.find(params[:package_id])
    @product_to_replace = Product.find(params[:product_id])

    # Rechercher un produit de la même catégorie, pièce et style
    @replacement_product = Product.where(
      product_category: @product_to_replace.product_category,
      room: @product_to_replace.room,
      style: @product_to_replace.style
    ).where.not(id: @product_to_replace.id).sample

    if @replacement_product
      # Remplacer le produit dans le package
      @package.products.delete(@product_to_replace)
      @package.products << @replacement_product
      @sum = 0
      @package.products.each do |product|
        @sum += product.price
      end
      flash.now[:success] = "Produit remplacé avec succès."
        respond_to do |format|
          format.html { redirect_to package_path(@package), notice: "Produit remplacé avec succès." }
          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.replace("product-#{@product_to_replace.id}", partial: "packages/product", locals: { product: @replacement_product, package: @package }),
              turbo_stream.update("package-#{@package.id}-budget", "Budget total : #{@sum.round}€", locals: { sum: @sum }),
              turbo_stream.prepend("flashes", partial: "shared/flashes", locals: { notice: "Produit remplacé avec succès !" })
            ]
          end
        end
    else
        respond_to do |format|
          format.html { redirect_to package_path(@package), alert: "Aucun produit de remplacement disponible." }
          format.turbo_stream
        end
      # Turbo::StreamsChannel.broadcast_replace_to "package_#{@package.id}_products",
      #                   target: "package-#{@package.id}",
      #                   partial: "packages/package",
      #                   locals: { package: @package }

    end
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
