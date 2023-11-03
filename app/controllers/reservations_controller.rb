class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations/
  def index
    user_id = params[:user_id]
    user = User.find(user_id)
    if user.nil?
      render json: { status: 'User not found', message: 'No user with the provided username' }, status: :not_found
    else
      @reservations = Reservation.where(user_id: user.id).includes(:car)
      @reservations.each do |reservation|
        reservation.car.image_url = url_for(reservation.car.image) if reservation.car.image.attached?
      end
      render json: @reservations.to_json(include: :car)
    end
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    car_id = reservation_params[:car_id]
    date = reservation_params[:date]
    car_reservation = Reservation.find_by(car_id:, date:)
    if car_reservation
      # Car is already reserved on this date, handle the error
      render json: { status: 'Not booked', message: 'This Car is already reserved on this date' }
    else
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        render json: { car: @reservation, status: 'booked', message: 'Car booked successfully' }, status: :created
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /reservations/1
  def destroy
    if @reservation.destroy
      render json: { message: 'Your reservation has been cancelled', status: 'Success' }
    else
      render json: { message: 'There was some issue cancelling your reservation', status: 'Failed' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:date, :city, :user_id, :car_id)
  end
end
