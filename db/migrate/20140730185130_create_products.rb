class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :part_number
      t.string :made_by
      t.string :car_brand
      t.string :model
      t.string :name
      t.float :count
      t.float :price
      t.string :sae
      t.text :specification
      t.text :description
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
