class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.attachment :file
      t.integer :snapshots_count
      t.integer :new_parts
      t.integer :found_parts

      t.timestamps
    end
  end
end
