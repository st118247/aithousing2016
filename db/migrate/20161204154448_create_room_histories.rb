class CreateRoomHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :room_histories do |t|
      t.string :category_no
      t.string :dorm
      t.string :student_id
      t.timestamp :arrival_date
      t.timestamp :leave_date
      t.integer :allocated_user_id
      t.integer :deallocated_user_id
      t.references :room_management, foreign_key: true

      t.timestamps
    end
  end
end
