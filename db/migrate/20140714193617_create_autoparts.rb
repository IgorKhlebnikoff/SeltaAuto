class CreateAutoparts < ActiveRecord::Migration
  def change
    create_table :autoparts do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :availability, default: 0
      t.attachment :picture

      t.timestamps
    end
  end
end
