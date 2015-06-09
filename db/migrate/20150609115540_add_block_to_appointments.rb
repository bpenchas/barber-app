class AddBlockToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :block, :text
  end
end
