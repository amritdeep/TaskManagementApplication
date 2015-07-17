class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_invitation(current_user, user, task)
  	@current_user = current_user
  	@user = user
  	@task = task
  	
  	mail(to: @user.email, subject: "Share Task With You")
  end
end
