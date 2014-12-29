class Category < ActiveRecord::Base
  has_many :news

  validates :name, presence: true
end
