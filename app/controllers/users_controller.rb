class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all.order(name: :asc)
    if current_user.name == "ゲスト"
      @users = User.where.not(name: "管理者ゲスト").order(name: :asc)
    elsif current_user.name == "管理者ゲスト"
      @users = User.where.not(name: "ゲスト").order(name: :asc)
    else
      @users = User.where.not(name: "管理者ゲスト").where.not(name: "ゲスト").order(name: :asc)
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      @albums = Album.where(user_id: @user.id).order(published: :desc).order(visited_on: :asc)
    else
      @albums = Album.where(user_id: @user.id).published.order(visited_on: :asc)
      
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to users_path, notice: t('destroyed_user')
  end

end
