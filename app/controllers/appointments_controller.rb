class AppointmentsController < ApplicationController
	before_action :find_appointment, only: [:show, :edit, :update, :destroy]

	def new
		@appointments = Appointment.all
		@appointment = Appointment.new
		@appointment.save

	end
	def update
		
 
	    if @appointment.update(appointment_params)
	      redirect_to @appointment
	    else
	      render 'edit'
	    end
	end
	

	def edit
	
	end

	def create

		@appointment = Appointment.new(appointment_params)
		
		
		if @appointment.save
			
			redirect_to @appointment, notice: 'Successfully created new appointment'

		else
			render 'new'
		end

	end

	def destroy
    	@appointment.destroy
    	redirect_to root_path
   	end

	def show
		
	end

	def index
		@appointments = Appointment.all
	end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def appointment_params
	  params.require(:appointment).permit(:slot, :client_number, :time)
	end

	def find_appointment
	  @appointment = Appointment.find(params[:id])
	end

end
