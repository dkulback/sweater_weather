class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(email: params[:email], password: params[:password],
                        password_confirmation: params[:password_confirmation])

    user.update(api_key: ApiKey.generator)
    WelcomeUserEmailJob.perform_async(user.email)

    render json: UsersSerializer.user(user), status: :created
  end
end
