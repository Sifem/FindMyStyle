class Recommendation < ApplicationRecord
  belongs_to :silhouette
  has_many :bookmarks
  has_many :users, through: :bookmarks
end
