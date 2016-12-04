class CreateRoomManagements < ActiveRecord::Migration[5.0]
  def change
    create_table :room_managements do |t|
      t.string :room_no,      unique: true
      t.string :category_no,  null: false
      t.string :dorm,         null: false
      t.string :status,       null: false
      t.string :student_id
      t.timestamp :arrival_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
