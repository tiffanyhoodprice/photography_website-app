class User < ActiveRecord::Base
  has_many :albums, through: :album_photos
  has_many :photos, through: :user_photos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
