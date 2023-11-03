class CarsController < ApplicationController
  def index
    @cars = Car.all.order('created_at DESC')
    @cars.each do |car|
      car.image_url = url_for(car.image) if car.image.attached?
    end
    render json: @cars
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      @car_data = @car.as_json(include: :image)
      @car_data['image_url'] = url_for(@car.image)
      render json: { car: @car_data, message: 'Car created successfully' }, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def show
    @car = Car.find(params[:id])
    if @car.image.attached?
      @car_data = @car.as_json(include: :image)
      @car_data['image_url'] = url_for(@car.image)
    else
      @car_data = @car.as_json
    end
    render json: @car_data
  end

  def car_params
    params.require(:car).permit(:name, :price, :color, :model, :image)
  end
end
