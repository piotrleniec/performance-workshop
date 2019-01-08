class Residence < ApplicationRecord
  belongs_to :landlord
  has_many :rooms

  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :square_meters, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
