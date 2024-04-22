class CreateTransitions < ActiveRecord::Migration[7.1]
  def change
    create_table :transitions do |t|
      t.references :silhouette, null: false, foreign_key: true
      t.string :goal

      t.timestamps
    end
  end
end
