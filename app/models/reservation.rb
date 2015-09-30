class Reservation < ActiveRecord::Base
  belongs_to :renter
  belongs_to :car
end
