class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos, through: :album_photos
end
