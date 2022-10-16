class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_posted_user, only: %i[edit]

  def index
    guest = User.guest
    admin_guest = User.guest_admin
    @albums = Album.where('title ilike ?', "%#{params[:title]}%").order(visited_on: :asc)
    if current_user == admin_guest
      @albums = @albums.includes(:user).where.not(user: {email: 'guest@example.com'})
    elsif current_user == guest
      @albums = @albums.includes(:user).where.not(user: {email: 'guest_admin@example.com'})
    else
      @albums = @albums.includes(:user).where.not(user: {email: 'guest@example.com'}).where.not(user: {email: 'guest_admin@example.com'})
    end
  end
  
  def new
    @album = Album.new
    @user = User.find_by(id: params[:user_id])
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

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @user = User.find_by(id: params[:album][:user_id])
    @album = Album.new(album_params)
      if @album.save
        redirect_to album_path(@album), notice: t('notice.created_album')
      else
        if current_user == @user
          @albums = @user.albums.order(published: :desc).order(visited_on: :asc)
        else
          @albums = @user.albums.published.order(visited_on: :asc)
        end
            render 'users/show'
      end
  end

  def update
    @album = Album.find(params[:id])
    @user = @album.user
    if @album.update(album_params)
      redirect_to user_path(@user), notice: t('notice.updated_album')
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
    params.require(:album).permit(:title, :visited_on, :user_id, :published)
  end

  def ensure_posted_user
    @album = Album.find(params[:id])
    unless current_user == @album.user
      redirect_to album_path, notice: t('notice.access_denied')
    end
  end

end
