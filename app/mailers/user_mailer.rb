class UserMailer < ActionMailer::Base
  default from: 'team@earnout-now.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, bcc: 'duncan@heatspring.com', subject: 'Welcome to EarnOut')
  end
end
