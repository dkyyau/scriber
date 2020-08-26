class RemoveBillingPeriodFromUserSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_subscriptions, :billing_period, :string
  end
end
