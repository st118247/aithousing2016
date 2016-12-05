class AddHousingcategorypicsToHousingdetails < ActiveRecord::Migration[5.0]
  def change
    add_column :housing_details, :housingcategorypics, :json
  end
end
