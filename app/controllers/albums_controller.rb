class AlbumsController < ApplicationController
  before_action :authenticate_user!

  def index
      @albums = Album.where('title ilike ?', "%#{params[:title]}%").where.not(user_id: 5).where.not(user_id: 6)
  end

  def show
    @album = Album.find(params[:id])
    @spots = @album.spots
    gon.spots = @spots
    @user = User.find_by(id: params[:user_id])
    
    if params[:tag_id].present?
    @spots = @spots.joins(:tags).where(tags: { id: params[:tag_id] })
    gon.spots = @spots
    end
  end
  
  def new
    @album = Album.new
    @user = User.find_by(id: params[:user_id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @user = User.find_by(id: params[:album][:user_id])
    @album = Album.new(album_params)
      if @album.save
        redirect_to album_path(@album), notice: t('notice.created_album')
      else
        render template: 'users/show'
      end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album), notice: t('notice.updated_album')
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    @album.destroy
    redirect_to user_path(@user.id), notice: t('notice.destroyed_album')
  end

  private
  def album_params
    params.require(:album).permit(:title, :visited_on, :user_id)
  end

end
