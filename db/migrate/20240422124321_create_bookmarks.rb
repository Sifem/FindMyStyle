class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :silhouette, foreign_key: true
      t.timestamps
    end
  end
end
