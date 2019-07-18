class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :growshops, dependent: :destroy
  has_many :comments, dependent: :destroy
  geocoded_by :address
  after_validation :geocode
end
