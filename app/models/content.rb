
class Content < ActiveRecord::Base
  include ContentLoad
  has_attached_file :picture, styles: {
                                logo: '300x200>',
                                big:  '500x300>'
                              },
                              default_url: '/pictures/:style/missing.png'

  validates :name, :description, presence: true
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  before_save :strip_html_description

  private

  def strip_html_description
    self.description = description.gsub('&nbsp;', '')
    self.description = description.gsub('&ndash;', '')
  end
end
