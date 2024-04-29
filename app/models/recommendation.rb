class Recommendation < ApplicationRecord
  has_many :bookmarks
  has_many :users, through: :bookmarks
  belongs_to :exchangeable, polymorphic: true
  has_one_attached :photo
end
