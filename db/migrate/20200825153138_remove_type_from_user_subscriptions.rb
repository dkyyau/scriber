class RemoveTypeFromUserSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_subscriptions, :type, :string
  end
end
