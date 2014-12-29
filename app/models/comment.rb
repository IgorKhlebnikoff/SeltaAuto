class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :news, counter_cache: true

  validates :body, presence: true
end
