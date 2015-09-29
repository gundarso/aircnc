class Reservation < ActiveRecord::Base
  belongs_to :renter
  belongs_to :car
  belongs_to :city, through: :car
end
