class PhotosController < ApplicationController
  before_action :authenticate_admin!, except: [:index]

  def index
    # @photo = Photo.find(3)
    @photo = Photo.all
  end

  def show
    @photo = Photo.find_by(id: params[:id])
  end

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

 

  # def show
  # end

  def destroy
    Photo.find_by(id: params[:id]).destroy!
    redirect_to "/admin"
  end

  def edit
    id = params[:id]
    @photo = Photo.find_by(id: id)
  end

  
  # def favorite
  #   @photo = Photo.find(params[:id])
  #   @photo.favorites.create(user: current_user)
  #   redirect_to user_path(@user)
  # end

  # # remove favorite
  # def unfavorite
  #   @photo = Photo.find(params[:id])
  #   @photo.favorites.where(user: current_user).destroy_all
  #   redirect_to user_path(@user)
  # end


  # def favorite
  #   @User = User.find_by(id: params[:id])
  #   current_user.
  # end

  # def favorite
  #   type = params[:type]
  #   if type == "favorite"
  #     current_user.favorites << @photo
  #     redirect_to :back, notice: 'You favorited photo #{@photo.id}'

  #   elsif type == "unfavorite"
  #     current_user.favorites.delete(@user)
  #     redirect_to :back, notice: 'Unfavorited photo #{@photo.id}'

  #   else
  #     # Type missing, nothing happens
  #     redirect_to :back, notice: 'Nothing happened.'
  #   end
  # end
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
      params.require(:photo).permit(:name, :album_id, category_ids: [])
    end

end
