class CreateUserSilhouettes < ActiveRecord::Migration[7.1]
  def change
    create_table :user_silhouettes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :silhouette, null: false, foreign_key: true

      t.timestamps
    end
  end
end
