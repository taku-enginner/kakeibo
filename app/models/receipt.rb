class Receipt < ApplicationRecord
  belongs_to :receipt_category
  belongs_to :user_group
end
