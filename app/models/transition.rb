class Transition < ApplicationRecord
  belongs_to :silhouette
  has_many :recommendations, as: :exchangeable
end
