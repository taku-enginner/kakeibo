class Receipt < ApplicationRecord
  belongs_to :receipt_category
  belongs_to :user_group, optional: true
end
