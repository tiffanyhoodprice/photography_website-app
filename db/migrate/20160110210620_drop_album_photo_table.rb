class DropAlbumPhotoTable < ActiveRecord::Migration
  def change
    drop_table :album_photos
  end
end
