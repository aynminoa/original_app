class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.where.not(name: "ゲスト").where.not(name: "管理者ゲスト")
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
