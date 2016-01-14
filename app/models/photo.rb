class Photo < ActiveRecord::Base

  mount_uploader :name, PhotoUploader

  belongs_to :album
  has_many :categorized_photos
  has_many :categories, through: :categorized_photos
  
  accepts_nested_attributes_for :categorized_photos
  # accepts_nested_attributes_for :album_photos
end
