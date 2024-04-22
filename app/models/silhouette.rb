class Silhouette < ApplicationRecord
  has_many :recommendations, as: :exchangeable
  has_many :transitions
  has_one_attached :photo
end
