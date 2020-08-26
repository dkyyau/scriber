class RemindersController < ApplicationController
  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @user_subscription = UserSubscription.find(params[:user_subscription_id])
    @reminder.user_subscription = @user_subscription
    if @reminder.save
      redirect_to user_subscription_path(@user_subscription)
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
    params.require(:reminders).permit(:date, :details)
  end
end
