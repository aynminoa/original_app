class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(spot_id: params[:spot_id])
    redirect_to spot_path(params[:spot_id]), notice: "#{favorite.spot.album.user.name}さんのspotをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to spot_path, notice: "#{favorite.spot.album.user.name}さんのspotをお気に入り解除しました"
  end
end
