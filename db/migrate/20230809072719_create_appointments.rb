class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :select_date
      t.time :select_time

      t.timestamps
    end
  end
end
