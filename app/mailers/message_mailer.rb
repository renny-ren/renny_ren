class MessageMailer < ApplicationMailer
  def feedback_email(author, contact_info, body)
    @author = author
    @contact_info = contact_info
    @body = body
    mail(from: '锦城之家 <admin@jinchengzj.com>', to: 'rennyallen@hotmail.com', subject: 'renny_ren blog mail')
  end
end