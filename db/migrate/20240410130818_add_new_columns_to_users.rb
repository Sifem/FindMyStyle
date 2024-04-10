class AddNewColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :payment, :boolean, default: false
  end
end
