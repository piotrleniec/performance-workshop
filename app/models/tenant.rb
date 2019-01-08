class Tenant < ApplicationRecord
  belongs_to :room

  validates :name, presence: true
  validates :gender, inclusion: { in: %w[m f] }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :student, inclusion: { in: [true, false] }
end
