class CreateInspectionRequests < ActiveRecord::Migration
  def change
    create_table :inspection_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.text :comment
      t.boolean :viewed
      t.integer :viewed_by_id

      t.timestamps
    end
  end
end
