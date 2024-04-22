class Recommendation < ApplicationRecord
  belongs_to :exchangeable, polymorphic: true
end
