class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.text :body
      t.integer :import_id
    end
  end
end
