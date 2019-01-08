class Room < ApplicationRecord
  belongs_to :residence
  has_one :tenant

  validates :square_meters, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :furnished, inclusion: { in: [true, false] }
end
