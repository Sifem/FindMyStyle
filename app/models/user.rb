class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_silhouettes
  has_many :silhouettes, through: :user_silhouettes
  has_many :messages

  has_many :bookmarks
  has_many :recommendations, through: :bookmarks

end
