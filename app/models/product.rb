class Product < ActiveRecord::Base
  include Filterable, Searchable

  validates :name, :count, :price, presence: true

  class << self
    def create_from_snapshot(params)
      part = find_by_part_number(params[uniq_column])
      create(params) unless part
    end

    protected

    def uniq_column
      raise NotImplementedError.new("create_from_snapshot method is not overridden in #{self.class.name}")
    end
  end

  def create_from_snapshot(_)
    raise NotImplementedError.new("create_from_snapshot method is not overridden in #{self.class.name}")
  end
end
