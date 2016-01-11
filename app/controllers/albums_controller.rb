class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(name: params[:album][:name])
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
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

  def portraits
  end

  def weddings  
  end

  def family
  end

  def events
  end

  def destroy
    Album.find_by(id: params[:id]).update(active: false)
    redirect_to "/albums"
  end
  
end
