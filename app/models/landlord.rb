class Landlord < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
