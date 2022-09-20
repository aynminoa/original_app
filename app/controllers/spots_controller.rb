class SpotsController < ApplicationController
  before_action :set_spot, only: %i[ show edit update destroy ]

  def index
    @spots = Spot.all
  end

  def show
    gon.spot = @spot
    @album = Album.find_by(id: params[:album_id])
  end

  def new
    @spot = Spot.new
    @album = Album.find_by(id: params[:album_id])
  end
  
  def edit
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

    @spot.destroy
    @album = Album.find_by(id: params[:album_id])
      redirect_to album_url(@album.id), notice: "Spot was successfully destroyed."
  end

  private
    def set_spot
      @spot = Spot.find(params[:id])
    end

    def spot_params
      params.require(:spot).permit(:name, :address, :visited_on, :url, :comment,:album_id, :latitude, :longitude, :category_id, images: [])
    end
end
