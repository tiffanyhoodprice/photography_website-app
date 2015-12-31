class AddCatIdPhotoIdToCatPhotos < ActiveRecord::Migration
  def change
    add_column :categorized_photos, :category_id, :integer
    add_column :categorized_photos, :photo_id, :integer
  end
end
