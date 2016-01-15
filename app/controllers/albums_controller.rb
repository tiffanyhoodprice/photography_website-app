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
      redirect_to '/admin'
    else
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    if @album.user_id != current_user.id
      flash[:admin_violation] = "Need special permissions."
      redirect_to '/'
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
  end

  # def update
  #   @album = Album.find_by(id: params[:id])
  #   if @album.update(album_params)
  #     redirect_to "/album/#{@albumid}"
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    # throw 'yo'
    Album.find_by(id: params[:id]).destroy!
    redirect_to "/admin"
  end
  
  private

    def album_params    
      params.require(:album).permit(:name)
    end

end
