class BillingPlan < ApplicationRecord
  has_many :user_subscriptions

  PLANS = {
    "Weekly": 1.week,
    "Monthly": 1.month,
    "3 months": 3.month,
    "12 months": 1.year,
    "24 months": 2.year
  }
end
