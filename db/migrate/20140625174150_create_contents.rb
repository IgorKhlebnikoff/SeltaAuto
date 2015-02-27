class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.text :description
      t.attachment :picture
      t.integer :user_id
      t.string :type
      t.timestamps
    end

    create_table :certificates do |t|
      t.belongs_to :content, index: true
      t.timestamps
    end
  end
end
