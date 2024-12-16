class PackagesController < ApplicationController
  def index
    @packages = Package.all
    # params = params[:params_package] if params[:params_package]
    # package_params =
    @params = params&.to_unsafe_h.except(:commit, :controller, :action)
    if params[:chambre] == "1"
      current_user.budget = 0
      @chambre = "Chambre"
      @room_chambre = Room.find_by(name: "Bedroom")
      @package_chambre = Package.where("budget BETWEEN ? AND ?", @params[:package][:budget_chambre_min].to_i, @params[:package][:budget_chambre_max].to_i).where(room_id: @room_chambre.id)
      current_user.budget += params[:package][:budget_chambre_max].to_i
      current_user.save
      @package_chambre.each do |proposal|
        Proposal.find_or_create_by!(user_id: current_user.id, package_id: proposal.id, favorite: false)
      end
      @package_chambre = "Cui cui... Il n'y a pas de résultats :(" if @package_chambre.empty?
    else
      @chambre = "nul"
    end
    if @params[:salon] == "1"
      current_user.budget = 0
      @salon = "Salon"
      @room_salon = Room.find_by(name: "Living Room")
      @package_salon = Package.where("budget BETWEEN ? AND ?", @params[:package][:budget_salon_min].to_i, @params[:package][:budget_salon_max].to_i).where(room_id: @room_salon.id)
      current_user.budget += params[:package][:budget_salon_max].to_i
      current_user.save
      @package_salon.each do |proposal|
        Proposal.find_or_create_by!(user_id: current_user.id, package_id: proposal.id, favorite: false)
      end
      @package_salon = "Cui cui... Il n'y a pas de résultats :(" if @package_salon.empty?
    else
      @salon = "nul"
    end
    if @params[:salle_de_bain] == "1"
      current_user.budget = 0
      @salle_de_bain = "Salle de bain"
      @room_sdb = Room.find_by(name: "Bathroom")
      @package_sdb = Package.where("budget BETWEEN ? AND ?", @params[:package][:budget_sdb_min].to_i, @params[:package][:budget_sdb_max].to_i).where(room_id: @room_sdb.id)
      current_user.budget += params[:package][:budget_salle_de_bain_max].to_i
      current_user.save
      @package_sdb.each do |proposal|
        Proposal.find_or_create_by!(user_id: current_user.id, package_id: proposal.id, favorite: false)
      end
      @package_sdb = "Cui cui... Il n'y a pas de résultats :(" if @package_sdb.empty?
    else
      @package_sdb = "nul"
    end
    if @params[:cuisine] == "1"
      current_user.budget = 0
      @cuisine = "Cuisine"
      @room_cuisine = Room.find_by(name: "Kitchen")
      @package_cuisine = Package.where("budget BETWEEN ? AND ?", @params[:package][:budget_cuisine_min].to_i, @params[:package][:budget_cuisine_max].to_i).where(room_id: @room_cuisine.id)
      # user = User.find(current_user.id)
      current_user.budget += params[:package][:budget_cuisine_max].to_i
      current_user.save
      @package_cuisine.each do |proposal|
        Proposal.find_or_create_by!(user_id: current_user.id, package_id: proposal.id, favorite: false)
      end
      @package_cuisine = "Cui cui... Il n'y a pas de résultats :(" if @package_cuisine.empty?
    else
      @package_cuisine = "nul"
    end
  end

  def create
  end

  def new
    @package = Package.new
  end

  def show
    @package = Package.find(params[:id])
    @proposal = Proposal.find_by(user: current_user, package: @package)
    @package_params = params.to_unsafe_h.except(:id, :controller, :action)
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
      @package.update(budget: @package.budget - @product_to_replace.price)
      @package.products.delete(@product_to_replace)
      @package.products << @replacement_product
      @sum = 0
      @package.products.each do |product|
        @sum += product.price
      end
      flash.now[:notice] = "Produit remplacé avec succès."
        respond_to do |format|
          format.html { redirect_to package_path(@package), notice: "Produit remplacé avec succès." }
          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.replace("product-#{@product_to_replace.id}", partial: "shared/product", locals: { product: @replacement_product, package: @package, fav: true}),
              turbo_stream.update("package-#{@package.id}-budget", "Budget total : #{@sum.round}€", locals: { sum: @sum }),
              turbo_stream.prepend("flashes", partial: "shared/flashes", locals: { notice: "Produit remplacé avec succès !" })
            ]
          end
        end
    else
      @proposal = Proposal.find_by(package: @package, user: current_user)
        respond_to do |format|
          format.html { redirect_to proposal_path(@proposal), alert: "Aucun produit de remplacement disponible." }
          format.turbo_stream
        end
      # Turbo::StreamsChannel.broadcast_replace_to "package_#{@package.id}_products",
      #                   target: "package-#{@package.id}",
      #                   partial: "packages/package",
      #                   locals: { package: @package }

    end
  end

  def destroy
    @package = Package.find(params[:id])
    @product_package = ProductPackage.find_by(package: @package, product_id: params[:product_id])
    @proposal = Proposal.find_by(package: @package, user: current_user)
    redirect_to proposal_path(@proposal), status: :see_other, proposal: "Le produit a été supprimé." if @product_package.destroy
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

# private


#   def package_new_params
#     params.require(:package).permit(:id, :name, :budget, :min, :max, :budget_salon_min, :budget_salon_max, :budget_chambre_min, :budget_chambre_max, :budget_sdb_min, :budget_sdb_max, :budget_cuisine_min, :budget_cuisine_max)
#   end
end
