class AlbumsController < ApplicationController
before_action :authenticate_user!

  def index
    @albums = current_user.albums
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = "Album has been created."
      redirect_to '/admin'
    else
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    if @album.user_id == current_user.id || current_user.user_type == 'admin'
    else
      flash[:admin_violation] = "Need special permissions."
      redirect_to '/'
    end
  end
 
  def edit
    id = params[:id]
    @album = Album.find_by(id: id)
    flash[:notice] = "Album has been edited."
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params)
      flash[:notice] = "Album has been updated."
      redirect_to "/albums/#{@album.id}"
    else
      render :index
    end
  end

  def destroy
    # throw 'yo'
    Album.find_by(id: params[:id]).destroy!
    redirect_to "/admin"
    flash[:notice] = "Album has been deleted."
  end
  
  private

    def album_params    
      params.require(:album).permit(:name, :user_id)
    end

end
