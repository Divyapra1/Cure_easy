class AddServiceProviderIdToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :service_provider_id, :bigint
  end
end
