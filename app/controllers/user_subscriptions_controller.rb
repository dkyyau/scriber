class UserSubscriptionsController < ApplicationController
  before_action :set_user_subscription, only: [:show, :edit, :update, :destroy]

  def new
    @user_subscription = UserSubscription.new
    @user_subscription.reminders.build
  end

  def show
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
  end

  def update
    @user_subscription.update(user_subscription_params)
    redirect_to user_subscription_path(@user_subscription)
  end

  def destroy
    @user_subscription.destroy
    redirect_to dashboard_path
  end

  private

  def set_user_subscription
    @user_subscription = UserSubscription.find(params[:id])
  end

  def user_subscription_params
    params.require(:user_subscription).permit(:start_date, :end_date, :payment_date, :cost,
    :billing_plan_id, :user_id, :subscription_id, :add_reminder, reminders_attributes: [:date, :details])
  end
end
