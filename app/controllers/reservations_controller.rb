class ReservationsController < ApplicationController
  before_action :find_car

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    if user_signed_in?
      @reservation = @car.reservations.build(reservation_params)
        if @reservation.save
          redirect_to car_path(@car), notice: "Your reservation has been successful"
        else
          render :new
        end
    else
      redirect_to cars_path, notice: "You have to be signed in to make a reservation"
    end
  end

  def destroy
    @reservation = @car.reservations.find(params[:id])
    @reservation.destroy
    redirect_to car_path(@car), notice: "Your reservation has been deleted"
  end

  private

  def find_car
    @car = Car.find(params[:car_id])
  end

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :rating, :car_id)
  end

end
