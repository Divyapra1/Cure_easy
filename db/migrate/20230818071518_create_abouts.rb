class CreateAbouts < ActiveRecord::Migration[5.2]
  def change
    create_table :abouts do |t|
      t.text :discription

      t.timestamps
    end
  end
end
