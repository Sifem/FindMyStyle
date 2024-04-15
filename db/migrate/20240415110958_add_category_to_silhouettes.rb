class AddCategoryToSilhouettes < ActiveRecord::Migration[7.1]
  def change
    add_column :silhouettes, :category, :string
  end
end
