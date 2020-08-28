class UserSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  has_many :reminders
  belongs_to :billing_plan
  validates :payment_date, presence: true
  validates :cost, presence: true
end
