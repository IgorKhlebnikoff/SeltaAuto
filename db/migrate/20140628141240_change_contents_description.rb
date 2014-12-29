class ChangeContentsDescription < ActiveRecord::Migration
  def change
    change_column :contents, :description, :text
  end
end
