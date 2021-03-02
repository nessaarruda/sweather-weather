class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: { error: user.errors.full_messages.uniq.to_sentence }, status: 401 # https://apidock.com/rails/v5.2.3/ActiveModel/Errors/full_messages
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
