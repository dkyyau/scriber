class CreateUserSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.date :payment_date
      t.decimal :cost
      t.string :type

      t.timestamps
    end
  end
end
