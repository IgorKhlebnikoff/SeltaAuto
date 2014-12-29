class AddErrorMessageToImports < ActiveRecord::Migration
  def change
    add_column :imports, :error_message, :text
  end
end
