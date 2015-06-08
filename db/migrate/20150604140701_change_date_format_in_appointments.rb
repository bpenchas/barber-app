class ChangeDateFormatInAppointments < ActiveRecord::Migration
  def change
  	def up
    	change_column :appointments, :slot, :datetime
	  end

	  def down
	    change_column :appointments, :slot, :date
	  end
  end
end
