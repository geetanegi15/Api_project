# Preview all emails at http://localhost:3000/rails/mailers/create_employee_notification_mailer
class CreateEmployeeNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/create_employee_notification_mailer/create_notification
  def create_notification
    CreateEmployeeNotificationMailer.create_notification
  end

end
