class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :asset_file_name
      t.integer :asset_file_size
      t.string :asset_content_type
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
