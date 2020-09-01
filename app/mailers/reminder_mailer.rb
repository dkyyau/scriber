class ReminderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.reminder.subject
  #
  def reminder
    @user = params[:user]
    @reminder = params[:reminder]
    @date = Date.today
    mail(to: @user.email, subject: 'Scriber Reminder 🔔')
    # This will render a view in `app/views/user_mailer`!
  end
end

#create route for admin get
#button to send reminders post
# iterate over users with reminder

