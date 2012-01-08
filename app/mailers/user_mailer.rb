class UserMailer < ActionMailer::Base

  default from: "no-reply@prayergalaxy.org"

  def verify_user(user)
    @user = user
    mail(:to => user.email, :subject => "PrayerGalaxy - Please verify your account")
  end

  def welcome(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to PrayerGalaxy")
  end

  def password_reset(user)
    @user = user
    mail(:to => user.email, :subject => "PrayerGalaxy - Password reset")
  end

end
