class Car < ActiveRecord::Base
  belongs_to :owner
  belongs_to :category
  has_many :reservations
  has_many :ratings, through: :reservations
  validates :category_id, presence: true
end
