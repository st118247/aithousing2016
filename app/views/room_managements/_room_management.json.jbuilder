json.extract! room_management, :id, :room_no, :category_no, :dorm, :status, :student_id, :arrival_date, :user_id, :created_at, :updated_at
json.url room_management_url(room_management, format: :json)