class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(email: params[:email], password: params[:password],
                        password_confirmation: params[:password_confirmation])

    WelcomeUserEmailJob.perform_async(user.email)

    render json: UsersSerializer.user(user), status: :created
  end
end
