class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :staff_id, :string, unique: true
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :tel, :string
    add_column :users, :status, :string
  end
end
