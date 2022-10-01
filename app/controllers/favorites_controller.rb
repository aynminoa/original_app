class FavoritesController < ApplicationController
  before_action :find_spot

  def index
    @favorite_spots = current_user.favorite_spots
  end

  def create
    @favorite = current_user.favorites.create(spot_id: params[:spot_id])
  end

  def destroy
    current_user.favorites.find_by(id: params[:id]).destroy
  end

  private

  def find_spot
    @spot = Spot.find(params[:spot_id])
  end

end
