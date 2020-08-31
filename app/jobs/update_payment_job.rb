require 'date'

class UpdatePaymentJob < ApplicationJob
  queue_as :default

  def perform(user_subscription)
   puts "Your old payment date is #{user_subscription.payment_date} "
   if Date.today > user_subscription.payment_date
    user_subscription.payment_date = user_subscription.payment_date + 1.month
    UpdatePaymentJob.set(wait_until: user_subscription.payment_date.noon).perform_later(user_subscription)
    puts "Your new payment date is #{user_subscription.payment_date}"
    # Do something later
  end
  end
end
