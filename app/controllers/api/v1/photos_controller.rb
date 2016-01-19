class Api::V1::PhotosController < ApplicationController
  
  def index
    @photos = Photo.all
  end

end
