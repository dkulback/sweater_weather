class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(email: params[:email], password: params[:password],
                        password_confirmation: params[:password_confirmation])
    respond_to do |format|
      if user.save
        WelcomeUserEmailJob.perform_async(user.email)
        format.json { render json: UsersSerializer.user(user), status: :created }
      else
        render json: { error: { message: 'failed to create you as a new user' } }
      end
    end
  end
end
