class FavoritePhotosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @favorite_photos = FavoritePhotos.all
  end

  def create
    if FavoritePhoto.create(photo_id: params[:photo_id], user_id: current_user.id)
    else
      flash[:warning] = "Problem uploading photo!"
    end
    redirect_to '/albums'
  end

  def destroy
    FavoritePhoto.where(photo_id: params[:photo_id], user_id: current_user.id).destroy
  end
  
end
