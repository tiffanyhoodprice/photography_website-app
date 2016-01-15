class CreateFavoritePhotos < ActiveRecord::Migration
  def change
    create_table :favorite_photos do |t|
      t.integer :user_id
      t.integer :photo_id

      t.timestamps null: false
    end
  end
end
