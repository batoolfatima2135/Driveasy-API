class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { user: @user, message: 'Login successfully' }, status: :created
    else
      error_message = "Username is already in use. Kindly use another username" if @user.errors[:username].include?("has already been taken")
      render json: { errors: [error_message || @user.errors.full_messages], message: 'Login failed' }, status: :unprocessable_entity
      end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
