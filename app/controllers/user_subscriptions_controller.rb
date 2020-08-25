class UserSubscriptionsController < ApplicationController
  def new
    @user_subscription = UserSubscription.new
  end

  def show
    @user_subscription = UserSubscription.find(params[:id])
  end

  def create
    @user_subscription = UserSubscription.new(user_subscription_params)
    @user_subscription.user = current_user
    if @user_subscription.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @user_subscription = UserSubscription.find(params[:id])
  end

  def update
    @user_subscription = UserSubscription.find(params[:id])
    @user_subscription.update(user_subscription_params)
    redirect_to user_subscription_path(@user_subscription)
  end

  def destroy
    @user_subscription = UserSubscription.find(params[:id])
    @user_subscription.destroy
    redirect_to user_subscription_path
  end
  private

  def user_subscription_params
    params.require(:user_subscription).permit(:start_date, :end_date, :payment_date, :cost,
    :billing_period, :user_id, :subscription_id)
  end
end
