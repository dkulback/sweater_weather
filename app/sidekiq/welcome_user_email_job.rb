class WelcomeUserEmailJob
  include Sidekiq::Job

  def perform(email)
    UserMailer.welcome_email(email).deliver_now
  end
end
