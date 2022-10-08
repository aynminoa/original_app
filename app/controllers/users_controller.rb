class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.name == "ゲスト"
      @users = User.where.not(name: "管理者ゲスト").order(name: :desc)
    elsif current_user.name == "管理者ゲスト"
      @users = User.where.not(name: "ゲスト").order(name: :desc)
    else
      @users = User.where.not(name: "管理者ゲスト").where.not(name: "ゲスト").order(name: :desc)
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      @albums = Album.where(user_id: @user.id)
    else
      @albums = Album.where(user_id: @user.id).published
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to users_path, notice: t('destroyed_user')
  end

end
