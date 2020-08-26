class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @user_subscriptions = @user.user_subscriptions

    @sub_costs = []
    @user_subscriptions.each do |sub|
      @sub_costs << sub.cost
    end
    @total_cost = @sub_costs.sum



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
