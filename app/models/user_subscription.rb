class UserSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  validates :payment_date, presence: true
  validates :cost, presence: true
  validates :billing_period, presence: true
end
