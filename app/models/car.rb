class Car < ActiveRecord::Base
  belongs_to :owner
  belongs_to :category
  has_many :reservations, dependent: :destroy
  has_many :ratings, through: :reservations
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
  validates :seats, numericality: { greater_than: 0 }
  validates :category_id, presence: true
  validates :rate, presence: true, numericality: true

  geocoded_by :city
  after_validation :geocode, if: :city_changed?
end
