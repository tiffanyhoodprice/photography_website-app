class UserPhotosController < ApplicationController

  def index
    @UserPhotos = UserPhoto.all
  end
  
  # def show
  #   @UserPhotos = UserPhoto.all
  # end

end
