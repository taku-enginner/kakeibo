class ReceiptCategory < ApplicationRecord
  has_many :receipts
  validates :name, presence: true
  validates :description, presence: true
  validates :food_related, presence: true
end
