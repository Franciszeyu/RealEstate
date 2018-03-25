class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :size
      t.integer :room
      t.integer :bathroom
      t.string :city
      t.string :postal_code
      t.integer :basement
      t.string :property_type
      t.integer :price

      t.timestamps
    end
  end
end
