class User < ActiveRecord::Base
  belongs_to :owner, :renter
end
