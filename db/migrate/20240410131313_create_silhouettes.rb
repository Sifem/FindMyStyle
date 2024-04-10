class CreateSilhouettes < ActiveRecord::Migration[7.1]
  def change
    create_table :silhouettes do |t|
      t.string :neutral_silhouette
      t.string :combined_silhouette

      t.timestamps
    end
  end
end
