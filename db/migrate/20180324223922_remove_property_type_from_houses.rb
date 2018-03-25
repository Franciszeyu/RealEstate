class RemovePropertyTypeFromHouses < ActiveRecord::Migration[5.1]
  def change
    remove_column :houses, :property_type, :string
  end
end
