class DropUserPhotoTableAgain < ActiveRecord::Migration
  def change
    drop_table :user_photos
  end
end