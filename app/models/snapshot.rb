class Snapshot < ActiveRecord::Base
  belongs_to :import, foreign_key: :import_id, class_name: Imports::Base

  serialize :body, JSON

  class << self
    def make(rows)
      rows.map { |row| object = create(body: row.to_hash) }
    end
  end

  def import_product
    product_class = import.type.demodulize.constantize
    product_class.create_from_snapshot(body)
  end
end
