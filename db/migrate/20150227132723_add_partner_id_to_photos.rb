class AddPartnerIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :partner_id, :integer
  end
end
