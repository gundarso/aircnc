class CarsController < ApplicationController
  before_action :find_car, only: [:show, :destroy]

  def index
    if params[:search]
      @cars = Car.where(city: params[:search], type: params[:search], seats: params[:search])
    else
      @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to show_car_path(@car)
    else
      render :new
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:type, :year, :mileage, :fuel, :seats, :city)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
