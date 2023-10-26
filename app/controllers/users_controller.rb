class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { status: 'created', message: 'Login successfully' }, status: :created
    else
      render json: { status: 'not unique', message: 'Username already taken'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
