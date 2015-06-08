class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :slot
      t.integer :client_number

      t.timestamps null: false
    end
  end
end
