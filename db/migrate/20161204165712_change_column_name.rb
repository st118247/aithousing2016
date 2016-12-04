class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :housing_details, :catgory_no, :category_id
  end
end
