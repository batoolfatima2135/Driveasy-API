class CarsController < ApplicationController
  def create
    @car = Car.new(car_params)

    if @car.save
      render json: { car: @car, message: 'Car created successfully' }, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def car_params
    params.require(:car).permit(:name, :price, :color, :model, :image)
  end
end
