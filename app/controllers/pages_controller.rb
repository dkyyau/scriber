require 'date'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end


  def dashboard
    @user = current_user
    @user_subscriptions = @user.user_subscriptions

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
