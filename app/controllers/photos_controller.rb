class PhotosController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :favorite]
  
  def index
    @photo = Photo.all
  end

  def show
    @photo = Photo.find_by(id: params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    album_id = photo_params[:album_id]
    category_ids = photo_params[:category_ids]
    photo_params[:names].each do |name|
      Photo.create(album_id: album_id, category_ids: category_ids, name: name)
    end
    flash[:success] = "Photo has been successfully uploaded."
    redirect_to "/admin"
  end

  def destroy
    Photo.find_by(id: params[:id]).destroy!
    flash[:success] = "Photo has been deleted."
    redirect_to "/admin"
  end

  def edit
    id = params[:id]
    @photo = Photo.find_by(id: id)
  end

  def favorite
    @photo = Photo.find(params[:photo_id])

    if !current_user.favorite_photos.find_by_photo_id(@photo.id)
      @favorite = FavoritePhoto.new(photo_id: params[:photo_id], user_id: current_user.id)
      @favorite.save
    else
      @photo.favorite_photos.find_by_user_id(current_user.id).destroy
    end
  end

  
  # def update
  #   @photo = Photo.find_by(id: params[:id])
  #   @photo.update(photo_params)
  #   flash[:success] = "Photo has been updated."
  #   redirect_to "/admin"
  #   # @photo = Photo.find(params[:id])
  #   # if @photo.update_attributes(params[:photo])
  #   #   flash[:notice] = 'Object created successfully, thank you'
  #   #   render :index  # if update is successful
  #   # else 
  #   #   flash[:notice] = 'Sorry! Object was not created successfully'  # if update is unsuccessful
  #   #   render :new
  #   # end
  #   # redirect_to photos_path
  # end

  private

    def photo_params    
      params.require(:photo).permit(:album_id, category_ids: [], names: [])
    end

end
