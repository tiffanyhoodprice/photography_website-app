class PhotosController < ApplicationController
  before_action :authenticate_admin!, except: [:index]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      # categorized_photo = CategorizedPhoto.new(category_id: :)
      redirect_to "/admin"
    else
    render :new
    end
  end

  def index
    # @photo = Photo.find(3)
    @photo = Photo.all
  end

  # def show
  # end

  def destroy
    Photo.find_by(id: params[:id]).destroy!
    redirect_to "/admin"
  end

  # def edit
  # end

  private

    def photo_params    
      params.require(:photo).permit(:name, :album_id, category_ids: [])
    end





end
