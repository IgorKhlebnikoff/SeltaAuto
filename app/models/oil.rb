class Oil < Product
  validates :sae, :specification, :description, presence: true

  class << self
    protected

    def uniq_column
      'name'
    end
  end
end
