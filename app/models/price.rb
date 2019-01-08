class Price < ApplicationRecord
  belongs_to :room

  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :all_bills_included, inclusion: { in: [true, false] }
end
