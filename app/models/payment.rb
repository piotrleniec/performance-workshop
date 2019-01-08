class Payment < ApplicationRecord
  belongs_to :tenant
  belongs_to :price

  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
