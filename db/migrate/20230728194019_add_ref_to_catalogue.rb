class AddRefToCatalogue < ActiveRecord::Migration[5.2]
  def change
    add_reference :catalogues, :category, foreign_key: true
    add_reference :catalogues, :sub_category, foreign_key: true
  end
end
