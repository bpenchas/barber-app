class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
  	change_column :appointments, :slot, :date
  end
end
