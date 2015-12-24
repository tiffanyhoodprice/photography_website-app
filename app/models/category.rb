class Category < ActiveRecord::Base
  has_many :photos, through: :categorized_photos
end
