class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :news_id
      t.integer :user_id
      t.timestamps
    end
  end
end