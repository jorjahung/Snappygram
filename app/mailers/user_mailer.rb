class UserMailer < ActionMailer::Base
  default from: "snappygramtest@gmail.com"

  def thanks_email(user, snap)
    @user = user
    @snap = snap
    attachments.inline['thumb.jpg'] = File.read(snap.image.path)
    mail(to: @user.email, subject: 'Thanks for your purchase!')
  end
end
