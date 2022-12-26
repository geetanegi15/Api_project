require 'test_helper'

class CreateEmployeeNotificationMailerTest < ActionMailer::TestCase
  test "create_notification" do
    mail = CreateEmployeeNotificationMailer.create_notification
    assert_equal "Create notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
