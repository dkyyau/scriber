class UserSubscription < ApplicationRecord

  attr_accessor :add_reminder #Used for simple_form (not on schema)
  belongs_to :user
  belongs_to :subscription
  has_many :reminders, dependent: :destroy
  belongs_to :billing_plan
  validates :payment_date, presence: true
  validates :cost, presence: true
end
