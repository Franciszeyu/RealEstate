class AddCategoryIdToHouse < ActiveRecord::Migration[5.1]
  def change
    add_column :houses, :category_id, :integer
  end
end
