class UserPhotosController < ApplicationController
  
  def admin
    if current_user && current_user.user_type == "admin"
      @album = Album.new
      @category = Category.new
      @photo = Photo.new
    else
      redirect_to '/'
      flash[:admin_violation] = "Need special permissions."
    end
  end

  def create_album
    @album = Album.new(name: params[:album][:name])
    if @album.save
      redirect_to 'root_path'
    else
      render :new
    end
  end

  def create_category
    @category = Category.new(name: params[:category][:name])
      if @category.save
        flash[:success] = "New category created"
        redirect_to root_path
      else
        render :new
      end
  end


  def create_photo
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to "/photos/new"
    else
    render :new
    end
  end

  private

    def photo_params    
      params.require(:photo).permit(:name, :album_id, category_ids: [])
    end

end
