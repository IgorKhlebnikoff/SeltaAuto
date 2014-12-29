class AddNecessaryColumnsToImport < ActiveRecord::Migration
  def change
    add_column :imports, :necessary_columns, :text
  end
end
