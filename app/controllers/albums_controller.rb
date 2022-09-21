class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: %i[new, edit, update, destroy]

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    @spots = @album.spots
    gon.spots = @spots
    @user = User.find_by(id: params[:user_id])
  end
  
  def new
    @album = Album.new
    @user = User.find_by(id: params[:user_id])
  end

  def edit
    @album = Album.find(params[:id])
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
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album), notice: "Album was successfully updated." 
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    @album.destroy
    redirect_to user_path(@user.id), notice: "Album was successfully destroyed." 
  end

  private
    def album_params
      params.require(:album).permit(:title, :visited_on, :user_id)
    end
end
