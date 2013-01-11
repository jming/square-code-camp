class ReminderMailer < ActionMailer::Base
  default from: "from@example.com"
  def oneday(recipient, event)
  	@event = event
  	mail(:to => recipient.email, :subject => "#{event.name} is tomorrow!")
  end
end
