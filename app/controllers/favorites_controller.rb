class FavoritesController < ApplicationController

  def index
    @favorite_spots = current_user.favorite_spots
  end

  def create
    favorite = current_user.favorites.create(spot_id: params[:spot_id])
    show_of_album_or_spot
    # redirect_to spot_path(params[:spot_id]), notice: "#{favorite.spot.album.user.name}さんのspotをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:favorite_id]).destroy
    show_of_album_or_spot
    # redirect_to spot_path, notice: "#{favorite.spot.album.user.name}さんのspotをお気に入り解除しました"
  end

  private

  def show_of_album_or_spot
    if params[:album_show]
      redirect_to album_path(params[:id])
    else
      redirect_to spot_path(params[:spot_id])
    end
  end

end
