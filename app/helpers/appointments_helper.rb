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

end