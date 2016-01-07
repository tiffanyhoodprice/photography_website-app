class Photo < ActiveRecord::Base

  mount_uploader :name, PhotoUploader

  has_many :albums, through: :album_photos
  has_many :categories, through: :categorized_photos
  has_many :users, through: :user_photos
end
