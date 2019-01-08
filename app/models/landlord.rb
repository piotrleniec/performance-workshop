class Landlord < ApplicationRecord
  has_many :residences
  has_many :rooms, through: :residences

  validates :name, presence: true, uniqueness: true
end
