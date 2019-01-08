class Landlord < ApplicationRecord
  has_many :residences

  validates :name, presence: true, uniqueness: true
end
