class CreateHousingDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :housing_details do |t|
      t.integer :version_id
      t.string :catgory_no
      t.string :status
      t.string :category_name
      t.string :dorm
      t.string :size
      t.string :air_con
      t.string :balcony
      t.string :bathroom
      t.string :kitchen
      t.string :furniture
      t.string :cleaning
      t.string :description
      t.string :rent
      t.string :attachment

      t.timestamps
    end
  end
end
