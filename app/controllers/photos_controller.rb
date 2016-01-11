class PhotosController < ApplicationController
  before_action :authenticate_admin!, except: [:index]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      # categorized_photo = CategorizedPhoto.new(category_id: :)
      redirect_to "/photos/new"
    else
    render :new
    end
  end

  def index
    @photo = Photo.find(3)
  end

  # def show
  # end

  # def destroy
  # end

  # def edit
  # end

  private

    def photo_params    
      params.require(:photo).permit(:name, :album_id, category_ids: [])
    end





end
