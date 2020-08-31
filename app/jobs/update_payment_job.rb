require 'date'

class UpdatePaymentJob < ApplicationJob
  queue_as :default

  def perform(user_subscription)
   puts "Your old payment date is #{user_subscription.payment_date} "
   if Date.today > user_subscription.payment_date
    case user_subscription.billing_plan.name
    when "Weekly"
      user_subscription.payment_date = user_subscription.payment_date.next_day(7)
    when "Monthly"
      user_subscription.payment_date = user_subscription.payment_date.next_month
    when "3 months"
      user_subscription.payment_date = user_subscription.payment_date.next_month(3)
    when "12 months"
      user_subscription.payment_date = user_subscription.payment_date.next_year
    when "24 months"
      user_subscription.payment_date = user_subscription.payment_date.next_year(2)
    end
    user_subscription.save
    UpdatePaymentJob.set(wait_until: user_subscription.payment_date.noon).perform_later(user_subscription)
    puts "Your new payment date is #{user_subscription.payment_date}"
    # Do something later
  end
  end
end
