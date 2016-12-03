class AddOfficerroleRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :officer_role, foreign_key: true
  end
end
