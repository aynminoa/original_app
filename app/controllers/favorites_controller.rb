class FavoritesController < ApplicationController
  before_action :find_spot

  def index
    @favorite_spots = current_user.favorite_spots
  end

  def create
    # binding.pry
    @favorite = current_user.favorites.create(spot_id: params[:spot_id])
    # show_of_album_or_spot
    # redirect_to spot_path(params[:spot_id]), notice: "#{favorite.spot.album.user.name}さんのspotをお気に入り登録しました"
  end

  def destroy
    current_user.favorites.find_by(id: params[:id]).destroy
    # show_of_album_or_spot
    # redirect_to spot_path, notice: "#{favorite.spot.album.user.name}さんのspotをお気に入り解除しました"
  end

  private

  def find_spot
    @spot = Spot.find(params[:spot_id])
  end
  # def show_of_album_or_spot
  #   if params[:album_show]
  #     redirect_to album_path(params[:id])
  #   else
  #     redirect_to spot_path(params[:spot_id])
  #   end
  # end

end
