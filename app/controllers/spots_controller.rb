class SpotsController < ApplicationController
  before_action :set_spot, only: %i[ show edit update destroy ]

  def index
    @spots = Spot.all
  end

  def show
    gon.spot = @spot
  end

  def new
    @spot = Spot.new
    @album = Album.find_by(id: params[:album_id])
  end
  
  def edit
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
    if @spot.update(spot_params)
      redirect_to spot_url(@spot), notice: "Spot was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @spot.destroy
      redirect_to spots_url, notice: "Spot was successfully destroyed."
  end

  private
    def set_spot
      @spot = Spot.find(params[:id])
    end

    def spot_params
      params.require(:spot).permit(:name, :address, :visited_on, :url, :comment, :latitude, :longitude, :album_id)
    end
end
