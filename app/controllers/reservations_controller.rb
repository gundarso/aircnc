class ReservationsController < ApplicationController

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new(reservation_params)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_show_path(@reservation)
    else
      render :new
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :rating)
  end

end
