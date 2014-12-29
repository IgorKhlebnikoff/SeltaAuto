class News < Content
  include Filter

  has_attached_file :asset, styles: { logo: '400x400>' }, default_url: '/pictures/:style/missing.png'

  belongs_to :user
  belongs_to :category

  has_many :comments

  validates :user, presence: true
end
