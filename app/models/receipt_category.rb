class ReceiptCategory < ApplicationRecord
  has_many :receipts
  validates :name, presence: true
  validates :food_related, inclusion: { in: [true, false] }
end
