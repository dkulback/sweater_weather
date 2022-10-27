class Api::V1::UsersController < ApplicationController
  wrap_parameters :user, include: %i[email password cell password password_confirmation]
  def create
    user = User.create!(user_params)
    if user.save
      session[:user_id] = user.id

      render json: UsersSerializer.user(user), status: :created
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :email)
  end
end
