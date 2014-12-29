class CreateInspectionRequestServiceTypes < ActiveRecord::Migration
  def change
    create_table :inspection_request_service_types do |t|
      t.integer :inspection_request_id
      t.integer :service_type_id
    end
  end
end
