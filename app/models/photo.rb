class Photo < ActiveRecord::Base
  belongs_to :album
  has_many :categories, through: :categorized_photos
end
