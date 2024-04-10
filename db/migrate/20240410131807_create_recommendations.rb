class CreateRecommendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recommendations do |t|
      t.text :description
      t.string :body_part
      t.string :function
      t.string :item
      t.references :silhouette, null: false, foreign_key: true

      t.timestamps
    end
  end
end
