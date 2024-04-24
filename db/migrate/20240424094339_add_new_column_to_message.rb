class AddNewColumnToMessage < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :response, :text
  end
end
