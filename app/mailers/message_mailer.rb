class MessageMailer < ApplicationMailer
  def feedback_email(body, contact_info)
    @body = body
    @contact_info = contact_info
    mail(from: '锦城之家 <admin@jinchengzj.com>', to: 'rennyallen@hotmail.com', subject: 'renny_ren blog mail')
  end
end