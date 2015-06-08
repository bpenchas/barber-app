class ChangeColumn < ActiveRecord::Migration
  def change
  	def up
    	change_column :appointments, :slot, :date
	  end

	  def down
	    change_column :appointments, :slot, :datetime
	  end
  end
end
