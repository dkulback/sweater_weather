class UserMailer < ApplicationMailer
  default from: 'dkulback@gmail.com'

  def welcome_email(email)
    require 'pry'
    binding.pry
    @url = 'https://shielded-atoll-16827.herokuapp.com'
    mail(to: email, subject: 'Welcome to My Sidekiq Job')
  end
end
