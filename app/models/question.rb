class Question < ActiveRecord::Base
  include Filterable

  belongs_to :user
  belongs_to :category

  has_many :answers

  validates :title, :body, :category_id, presence: true
end
