class Employee < ApplicationRecord
  belongs_to :company

  validates :name , presence: true
  validates :role , presence: true
  validates :email , presence: true
  #validates :pin , presence: true

  before_create :created_by_admin_mail
  
  def created_by_admin_mail
    CreateEmployeeNotificationMailer.create_notification(self).deliver_now
  end

  #def update_otp
  #  update(pin: rand(1_00000...9_99999))
  #end


end
