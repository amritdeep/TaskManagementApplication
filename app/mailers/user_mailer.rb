class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_invitation(user)
  	@user = user
  	mail(to: @user.email, subject: "Shaer Task With You")
  end
end
