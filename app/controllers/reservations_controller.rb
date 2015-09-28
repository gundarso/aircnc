class ReservationsController < ApplicationController

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @car = Car.find(params[:car_id])
    @reservation = Reservation.new
  end

  def create
    @car = Car.find(params[:car_id])
    @reservation = @car.reservations.build(reservation_params)
    if @reservation.save
      redirect_to reservations_show_path(@reservation)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :rating)
  end

end
