class AddCreatedbyToHousingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :housing_details, :createdby, :string
    add_column :housing_details, :updatedby, :string
  end
end
