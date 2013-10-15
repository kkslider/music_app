class UserMailer < ActionMailer::Base
  default from: "benjamsandwich@gmail.com"
  
  def activation_email(user)
    @user = user
    @url = "/?activation_token=#{@user.activation_token}"
    mail(to: @user.email, subject: 'Please activate your account')
  end
  
end
