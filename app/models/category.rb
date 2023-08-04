class Category < ApplicationRecord
has_and_belongs_to_many :sub_categories, join_table: :categories_sub_categories
has_one_attached :image
end
