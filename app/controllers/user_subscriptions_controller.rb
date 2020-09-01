class UserSubscriptionsController < ApplicationController

  def new
    @user_subscription = UserSubscription.new
    @user_subscription.reminders.build
  end

  def show
    @user_subscription = UserSubscription.find(params[:id])

    if @user_subscription.end_date.nil?
      @date = nil
    else
    @date = @user_subscription.end_date - @user_subscription.start_date
  end

  end

  def create
    @user_subscription = UserSubscription.new(user_subscription_params)
    @user_subscription.user = current_user
    if @user_subscription.save
      UpdatePaymentJob.set(wait_until: @user_subscription.payment_date.noon).perform_later(@user_subscription)
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
    redirect_to dashboard_path
  end
  private

  def user_subscription_params
    params.require(:user_subscription).permit(:start_date, :end_date, :payment_date, :cost,
    :billing_plan_id, :user_id, :subscription_id, :add_reminder, reminders_attributes: [:date, :details])
  end
end
