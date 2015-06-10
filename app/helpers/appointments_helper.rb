module AppointmentsHelper
	def can_edit_appointment?(appointment)
		current_user.admin? || appointment.user_id == current_user.id
	end
	# def is_taken?(appt)
	# 	@appointments = Appointment.all

	# 	@taken_slots = []
		
	# 	@appointments.each do |appt|
	# 			@taken_slots << [appt.slot, appt.time.strftime("%I:%M %p")]
	# 	end

	# 	if @taken_slots.include?([appt.slot, appt.time.strftime("%I:%M %p")])
	# 		return true
	# 	else
	# 		return false
	# 	end
	# end
	def send_text
	# Test Credentials
			account_sid = 'AC818b91aaf3aa4883ebd967c1ce05b4f8'
			auth_token = '635c887a39e2db3fffb74f31806d54d2'
			from_number = "+14086414548"
			# Developer number +15005550006
			# Emergency code SjBcxP8IdNqX//QdKvr8+Ma6o/DSWQU6m0nprKfT



			# set up a client to talk to the Twilio REST API
			@client = Twilio::REST::Client.new account_sid, auth_token

			# alternatively, you can preconfigure the client like so
			Twilio.configure do |config|
			  config.account_sid = account_sid
			  config.auth_token = auth_token
			end

			# and then you can create a new client without parameters
			@client = Twilio::REST::Client.new

			message = @client.messages.create(
			  from: from_number,
			  to: '+27715798156',
			  body: "You have an appointment!"
			)
	end

end