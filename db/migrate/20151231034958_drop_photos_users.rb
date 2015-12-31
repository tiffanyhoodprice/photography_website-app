class DropPhotosUsers < ActiveRecord::Migration
  def change
     drop_table :photos_users
  end
end
