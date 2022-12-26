class CreateEmployeeNotificationMailer < ApplicationMailer
  default from: 'geeta.negi@pixoatic.com'

 def create_notification(object)
    @object = object
    mail to: @object.email , subject: " testing the SMTP  "
  end
end
