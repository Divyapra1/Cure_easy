class AddCatalogueRefToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :catalogue, foreign_key: true
  end
end
