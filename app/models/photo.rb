class Photo < ActiveRecord::Base
  has_attached_file :asset, styles: {
                                      logo: '300x200>',
                                      big:  '500x300>'
                              },
                              default_url: '/pictures/:style/missing.png'
  do_not_validate_attachment_file_type :asset
end
