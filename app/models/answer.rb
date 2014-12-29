class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, counter_cache: true

  validates :body, presence: true
  validates :body, :user_id, :question_id, presence: true

end
