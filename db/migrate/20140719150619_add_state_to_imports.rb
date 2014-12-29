class AddStateToImports < ActiveRecord::Migration
  def change
    add_column :imports, :state, :string
  end
end
