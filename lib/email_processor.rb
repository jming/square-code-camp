class EmailProcessor
	def self.process 
		Event.where('occurs_at BETWEEN ? AND ?', Date.tomorrow.beginning_of_day, Date.tomorrow.end_of_day).find_each do |event|
			event.attendees.each do |attendee|
				ReminderMailer.oneday(attendee,event)
			end
		end
	end
end