class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      # categorized_photo = CategorizedPhoto.new(category_id: :)
      redirect_to root_path
    else
    # This line overrides the default rendering behavior, which
    # would have been to render the "create" view.
    render "new"
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
      params.require(:photo).permit(:name)
    end


end
