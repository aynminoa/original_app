class UsersController < ApplicationController
  
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @albums = Album.where(user_id: @user.id)
    @album = @user.albums.build
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to users_path, notice: "user was successfully destroyed."
  end

end
