class Autopart < Product
  validates :part_number, :made_by, :car_brand, :model, presence: true

  class << self
    protected

    def uniq_column
      'part_number'
    end
  end
end
