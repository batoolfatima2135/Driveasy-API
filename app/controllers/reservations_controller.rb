class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations/
  def index
    username = params[:username]
    user = User.find_by(username:)
    @reservations = Reservation.where(user_id: user.id)
    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    car_id = reservation_params[:car_id]
    date = reservation_params[:date]
    puts car_id
    puts date
    car_reservation = Reservation.find_by(car_id:, date:)
    puts 'car reservation'
    puts car_reservation
    if car_reservation
      # Car is already reserved on this date, handle the error
      render json: { status: "Not booked", message: 'This Car is already reserved on this date' }
    else
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        render json: { car: @reservation,  status: "booked", message: 'Car booked successfully' }, status: :created
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
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
