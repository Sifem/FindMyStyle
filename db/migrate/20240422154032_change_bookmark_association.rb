class ChangeBookmarkAssociation < ActiveRecord::Migration[7.1]
  def change
    remove_reference :bookmarks, :silhouette, index: true
    add_reference :bookmarks, :recommendation, foreign_key: true
  end
end
