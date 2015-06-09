class AppointmentsController < ApplicationController
	include AppointmentsHelper
	before_action :find_appointment, only: [:show, :edit, :update, :destroy]

	def new
		@appointments = Appointment.all
		@taken_slots = []

		@appointments.each do |appt|
				@taken_slots << [appt.slot, appt.time.strftime("%I:%M %p")]
		end

		# @appointments.each do |appt|
		# 	if is_taken?(appt)
		# 		@taken_times << appt.time.strftime("%I:%M %p")
		# 	end
		# end
		
		@appointment = Appointment.new
		@appointment.user_id = current_user.id
		@appointment.save
		

	end
	def update
		if can_edit_appointment?(@appointment)
	    if @appointment.update(appointment_params)
	      redirect_to @appointment
	    else
	      render 'edit'
	    end
	  else
	  	redirect_to root_path, alert: "You cannot edit that"
	  end
	end
	

	def edit
	
	end

	def create

		@appointment = Appointment.new(appointment_params)
		@appointment.user_id = current_user.id
		
		if @appointment.save
			
			redirect_to @appointment, notice: 'Successfully created new appointment'

		else
			render 'new'
		end

	end

	def destroy
    	if can_edit_appointment?(@appointment)
	    	@appointment.destroy
	    	redirect_to root_path
    	else
    		redirect_to :root, alert: "You cannot destroy this"
    	end
  end

	def show
		
	end

	def index
		@date = params[:month] ? Date.parse(params[:month]) : Date.today
		if current_user.admin?
	    @appointments = Appointment.all
	  else
	  	@appointments = current_user.appointments
	  end
	  @hash = Gmaps4rails.build_markers(@appointments) do |appt, marker|
  		marker.lat appt.latitude
  		marker.lng appt.longitude
  		marker.infowindow appt.name

		end
	end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def appointment_params
	  params.require(:appointment).permit(:slot, :client_number, :time, :name, :address, :latitude, :longitude, :block)
	end

	def find_appointment
	  @appointment = Appointment.find(params[:id])
	end

end
