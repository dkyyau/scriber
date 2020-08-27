class AddRefToUserSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_subscriptions, :billing_plan, null: false, foreign_key: true
  end
end
