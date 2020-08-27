class BillingPlan < ApplicationRecord
  has_many :user_subscriptions
end
