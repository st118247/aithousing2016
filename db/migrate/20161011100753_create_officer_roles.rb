class CreateOfficerRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :officer_roles do |t|
      t.string :role

      t.timestamps
    end
  end
end
