class RemindersController < ApplicationController
  def new
    @reminder = Reminder.new
    @user_subscription = UserSubscription.find(params[:user_subscription_id])
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @user_subscription = UserSubscription.find(params[:user_subscription_id])
    @reminder.user_subscription = @user_subscription
    if @reminder.save
      redirect_to  dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @reminder = Reminder.find(params[:id])
  end

  def update
    @reminder = Reminder.find(params[:id])
    @reminder.update(reminder_params)
    redirect_to user_subscription_path(@reminder.user_subscription)
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
    redirect_to user_subscription_path(@reminder.user_subscription)
  end

  private

  def reminder_params
    params.require(:reminder).permit(:date, :details)
  end
end
