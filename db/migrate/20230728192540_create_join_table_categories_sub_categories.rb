class CreateJoinTableCategoriesSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :sub_categories do |t|
      # t.index [:category_id, :sub_category_id]
      # t.index [:sub_category_id, :category_id]
    end
  end
end
