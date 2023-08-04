class CreateCatalogues < ActiveRecord::Migration[5.2]
  def change
    create_table :catalogues do |t|
      t.string :name
      t.float :price
      t.text :discription
      t.float :gst
      t.float :total

      t.timestamps
    end
  end
end
