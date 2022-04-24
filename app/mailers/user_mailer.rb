class UserMailer < ActionMailer::Base
  default from: 'dkulback@gmail.com'
  layout 'welcome_email'
  def welcome_email(email)
    @user = User.find_by(email: email)
    @url = 'https://shielded-atoll-16827.herokuapp.com'
    mail(to: email, subject: 'Welcome to My Sidekiq Job')
  end
end
