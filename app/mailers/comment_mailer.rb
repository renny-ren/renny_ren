class CommentMailer < ApplicationMailer
  def email_to_site_owner(comment)
    @comment = comment
    mail(from: 'Renny Ren <admin@jinchengzj.com>', to: 'rennyallen@hotmail.com', subject: "There's a new comment in my blog!")
  end
end
