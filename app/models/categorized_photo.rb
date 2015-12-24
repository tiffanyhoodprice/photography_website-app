class CategorizedPhoto < ActiveRecord::Base
  belongs_to :category
  belongs_to :photo
end
