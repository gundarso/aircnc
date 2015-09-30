class Car < ActiveRecord::Base
  belongs_to :owner
  belongs_to :category
  has_many :reservations, dependent: :destroy
  has_many :ratings, through: :reservations
  validates :category_id, presence: true
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
