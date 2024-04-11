class AddDescriptionToSilhouettes < ActiveRecord::Migration[7.1]
  def change
    add_column :silhouettes, :description, :text
  end
end
