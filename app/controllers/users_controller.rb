class UsersController < ApplicationController
  
  def show
    @user = current_user
    @album = @user.albums.build
  end

end
