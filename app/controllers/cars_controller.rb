class CarsController < ApplicationController
  def index
    @cars = Car.all

    render json: @cars
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      render json: { car: @car, message: 'Car created successfully' }, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def show
    @car = Car.find(params[:id])
    render json: @car
  end

  def car_params
    params.require(:car).permit(:name, :price, :color, :model, :image)
  end
end
