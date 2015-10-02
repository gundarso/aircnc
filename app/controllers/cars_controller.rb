class CarsController < ApplicationController
  before_action :find_car, only: [:show, :destroy]

  def index
    if params[:pickup_address].present?
      @cars = Car.near(params[:pickup_address], 10)
    #if params[:search]
      #@cars = Car.where(pickup_address: params[:search])
    else
      @cars = Car.all
    end

    @markers = Gmaps4rails.build_markers(@cars[0..9]) do | car, marker |
     marker.lat car.latitude
     marker.lng car.longitude
    end

  end

  def show
    @car = Car.find(params[:id])
    @car_coordinates = { lat: @car.latitude, lng: @car.longitude }
end


  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to car_path(@car)
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
    params.require(:car).permit(:pickup_address, :year, :mileage, :fuel, :seats, :rate, :category_id, :picture)
  end

  def find_car
   @car = Car.find(params[:id])
  end
end
