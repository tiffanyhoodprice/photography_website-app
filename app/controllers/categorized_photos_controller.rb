class CategorizedPhotosController < ApplicationController

  def weddings
    @CategorizedPhotos = CategorizedPhoto.where(category_id: 1)
  end

  def family
    @CategorizedPhotos = CategorizedPhoto.where(category_id: 2)
  end
  
  def events
    @CategorizedPhotos = CategorizedPhoto.where(category_id: 3)
  end
  
  def portraits
    @CategorizedPhotos = CategorizedPhoto.where(category_id: 4)
  end

  def scenic
    @CategorizedPhotos = CategorizedPhoto.where(category_id: 9)
  end


end
