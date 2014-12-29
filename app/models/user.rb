class User < ActiveRecord::Base
  include HasName

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

  has_many :inspection_requests, foreign_key: 'viewed_by_id'
  has_many :news
  has_many :questions
  has_many :answers
  has_many :comments

  def is_admin?
    role_id == Role.find_by_name('Admin').id
  end

  def is_worker?
    role_id == Role.find_by_name('Worker').id
  end

  def is_user?
    role_id.nil?
  end
end
