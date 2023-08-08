class SubCategory < ApplicationRecord
	has_and_belongs_to_many :categories, join_table: :categories_sub_categories
	has_many :catalogues
	has_one_attached :image
end
