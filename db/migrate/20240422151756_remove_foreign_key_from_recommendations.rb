class RemoveForeignKeyFromRecommendations < ActiveRecord::Migration[7.1]
  def change
    remove_reference :recommendations, :silhouette, foreign_key: true
    add_reference :recommendations, :exchangeable, polymorphic: true, null: false
  end
end
