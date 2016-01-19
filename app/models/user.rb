class User < ActiveRecord::Base
  has_many :albums
  has_many :photos, through: :user_photos
  
  has_many :favorite_photos
  has_many :favorites, through: :favorite_photos, source: :photo

  accepts_nested_attributes_for :favorite_photos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
