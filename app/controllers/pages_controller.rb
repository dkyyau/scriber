require 'date'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def admin
  end

  def send_reminder
    @reminders = Reminder.where(date: Date.today)
    @reminders.each do |reminder|
      @user = reminder.user_subscription.user
      @reminder = reminder
      ReminderMailer.with(user: @user, reminder: @reminder).reminder.deliver_now
    end
    redirect_to admin_path
  end


  def dashboard
    @user = current_user
    @user_subscriptions = @user.user_subscriptions
    @user_reminders = []
    @user_reminder_dates=[]
    @user_subscriptions.each do |subscription|
      subscription.reminders.each do |reminder|
       @user_reminders << reminder
       @user_reminder_dates << reminder.date
     end
     @dateTodayCount = 0;
     @dateMatch = false;
     @user_reminder_dates.each do |date|
     @dateMatch = date == Date.today ? true : false
     date == Date.today ? @dateTodayCount += 1 : false
     end
    end



    @subscriptions_current_month = []
    @user_subscriptions.each do |subscription|
      if subscription.payment_date.mon == Date.today.month
        @subscriptions_current_month << subscription
      end
    end

    @current_month_costs = []
    @subscriptions_current_month.each do |subscription|
        @current_month_costs << subscription.cost
    end
    @total_cost = @current_month_costs.sum

    if params[:query].present?
      sql_query = " \
        subscriptions.name ILIKE :query \
      "
      @user_subscriptions = UserSubscription.joins(:subscription).where(sql_query, query: "%#{params[:query]}%")
    else
      @user_subscriptions = @user.user_subscriptions

    end

  end
end
