class Reservation < ActiveRecord::Base
  belongs_to :renter, :car, :city, through: :car
end
