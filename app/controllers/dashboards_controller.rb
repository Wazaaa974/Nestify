class DashboardsController < ApplicationController
  def index
    @current_user_favorites = current_user.favorite_packages
    @room_chambre = Room.find_by(name: "Bedroom")
    @package_chambre = @current_user_favorites.where(room: @room_chambre)
    if @package_chambre.empty?
      @package_chambre = "Oula... Il n'y a pas de résultats :("
    end

    @room_salon = Room.find_by(name: "Living Room")
    @package_salon = @current_user_favorites.where(room: @room_salon)
    if @package_salon.empty?
      @package_salon = "Oula... Il n'y a pas de résultats :("
    end

    @room_sdb = Room.find_by(name: "Bathroom")
    @package_sdb = @current_user_favorites.where(room: @room_sdb)
    if @package_sdb.empty?
      @package_sdb = "Oula... Il n'y a pas de résultats :("
    end

    @room_cuisine = Room.find_by(name: "Kitchen")
    @package_cuisine = @current_user_favorites.where(room: @room_cuisine)
    if @package_cuisine.empty?
      @package_cuisine = "Oula... Il n'y a pas de résultats :("
    end
  end

  def destroy
    @proposal_to_destroy = Proposal.find_by(params[:id])
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to dashboards_path, status: :see_other if @proposal_to_destroy
  end
end

