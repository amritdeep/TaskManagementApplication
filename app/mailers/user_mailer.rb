class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_invitation(user, task)
  	@user = user
  	@task = task
  	
  	mail(to: @user.email, subject: "Share Task With You")
  end
end
