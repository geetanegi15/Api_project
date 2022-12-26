class Employee < ApplicationRecord
  belongs_to :company

  after_create :created_by_admin_mail
  
  def created_by_admin_mail
    CreateEmployeeNotificationMailer.create_notification(self).deliver_now
  end


end
