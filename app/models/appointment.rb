class Appointment < ActiveRecord::Base
	validates :slot, presence: true
	validates :time, presence: true
	validates :client_number, presence: true
end
