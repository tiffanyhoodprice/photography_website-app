class Photo < ActiveRecord::Base

  mount_uploader :name, PhotoUploader

  has_many :albums, through: :album_photos
  has_many :categorized_photos
  has_many :categories, through: :categorized_photos
  belongs_to :users, through: :user_photos
  accepts_nested_attributes_for :categorized_photos
end
