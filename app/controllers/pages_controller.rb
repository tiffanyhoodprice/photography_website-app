class PagesController < ApplicationController
before_action :authenticate_user!, only: [:admin]
  
  def admin
    if current_user && current_user.user_type == "admin"
      @album = Album.new
      @category = Category.new
      @photo = Photo.new
      @albums = Album.all
      @categories = Category.all
      @photos = Photo.all
      @users = User.all
    else
      redirect_to '/'
      flash[:admin_violation] = "Need special permissions."
    end
  end
  
  def index
    @albums = Album.all
  end

  def about
  end

end
