class UsersController < ApplicationController
  def create
    username = user_params[:username]
    existing_user = User.find_by(username:)

    if existing_user
      render json: { status: 'login', user_id: existing_user.id }
    else
      @user = User.new(user_params)

      if @user.save
        render json: { status: 'login', user_id: @user.id }, status: :created
      else
        render json: { status: 'error', message: 'Failed to create user', errors: @user.errors },
               status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
