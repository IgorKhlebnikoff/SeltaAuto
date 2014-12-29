# coding: utf-8

class InspectionRequestMailer < ActionMailer::Base
  default from: 'seltaauto.service@gmail.com'

  def new_request(inspection_request)
    @inspection_request = inspection_request
    mail(to: 'selta_auto@2upost.com', subject: 'Новый заявка на ТО', from: 'seltaauto.service@gmail.com')
  end
end
