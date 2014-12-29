class AddEmailToContents < ActiveRecord::Migration
  def change
    add_column :contents, :email, :string
  end
end
