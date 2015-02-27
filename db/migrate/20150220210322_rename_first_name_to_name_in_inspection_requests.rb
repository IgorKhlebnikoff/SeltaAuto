class RenameFirstNameToNameInInspectionRequests < ActiveRecord::Migration
  def change
    rename_column :inspection_requests, :first_name, :name
    remove_column :inspection_requests, :last_name
  end
end
