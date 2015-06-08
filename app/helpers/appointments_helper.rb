module AppointmentsHelper
	def can_edit_appointment?(appointment)
		current_user.admin? || current_user == appointment.user
	end
end