class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def show
    @spots = @album.spots
    gon.spots = @spots
    @user = User.find_by(id: params[:user_id])
  end
  
  def new
    @album = Album.new
    @user = User.find_by(id: params[:user_id])
  end

  def edit
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album), notice: "Album was successfully created." 
    else
      render :new
    end
  end

  def update
    if @album.update(album_params)
      redirect_to album_url(@album), notice: "Album was successfully updated." 
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @album.destroy
    redirect_to user_path(@user.id), notice: "Album was successfully destroyed." 
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :visited_on, :user_id)
    end
end
