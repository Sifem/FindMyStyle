class Silhouette < ApplicationRecord
  has_many :recommendations
  has_one_attached :photo
end
