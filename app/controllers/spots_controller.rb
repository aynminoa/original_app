class SpotsController < ApplicationController

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    gon.spot = @spot
    @album = Album.find_by(id: params[:album_id])
  end

  def new
    @spot = Spot.new
    @album = Album.find_by(id: params[:album_id])
  end
  
  def edit
    @spot = Spot.find(params[:id])
    @album = Album.find_by(id: params[:album_id])
  end
  
  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to spot_url(@spot), notice: "Spot was successfully created."
    else
      render :new
    end
  end

  def update
    @spot = Spot.find(params[:id])
    if params[:spot][:image_ids]
      params[:spot][:image_ids].each do |image_id|
        image = @spot.images.find(image_id)
        image.purge
      end
    end
    
    if @spot.update(spot_params)
      redirect_to spot_url(@spot), notice: "Spot was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    @album = Album.find_by(id: params[:album_id])
      redirect_to album_url(@album.id), notice: "Spot was successfully destroyed."
  end

  private
    def spot_params
      params.require(:spot).permit(:name, :address, :visited_on, :url, :comment, :album_id, :category, :latitude, :longitude, images: [], tag_ids: [])
    end
end
