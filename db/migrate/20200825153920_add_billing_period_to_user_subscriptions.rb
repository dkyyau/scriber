class AddBillingPeriodToUserSubscriptions < ActiveRecord::Migration[6.0]
  def change
     add_column :user_subscriptions, :billing_period, :string
  end
end
