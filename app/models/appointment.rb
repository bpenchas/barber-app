class Appointment < ActiveRecord::Base
	validates :slot, presence: true
	validate :slot_cannot_be_in_the_past

  def slot_cannot_be_in_the_past
    errors.add(:slot, "can't be in the past") if
      !slot.blank? and slot < Date.today
  end


	validates :time, presence: true
	validates :client_number, presence: true
	validates :name, presence: true
	validates :address, presence: true
	belongs_to :users, dependent: :destroy

	geocoded_by :address
	after_validation :geocode

end
