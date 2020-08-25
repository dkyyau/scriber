class UserSubscriptionsController < ApplicationController
  def new
    @user_subscription = UserSubscription.new
  end

  def create
    @user_subscription = UserSubscription.new(user_subscription_params)
    @user_subscription.save
    redirect_to user_subscription_path(@user_subscription)
  end

  # def edit
  #   @user_subscription = User_Subscription.find(params[:id])
  # end

  # def update
  #   @user_subscription = User_Subscription.find(params[:id])
  #   @user_subscription.update(user_subscription_params)
  #   redirect_to user_subscription_path(@user_subscription)
  # end

  # def destroy
  #   @user_subscription = User_Subscription.find(params[:id])
  #   @user_subscription.destroy
  #   redirect_to user_subscription_path
  # end

  private

  def user_subscription_params
    params.require(:user_subscription).permit(:start_date, :end_date, :payment_date, :cost,
    :type, :user_id, :subscription_id)
  end
end
