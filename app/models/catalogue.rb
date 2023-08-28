class Catalogue < ApplicationRecord
	has_many_attached :pictures
	belongs_to :category
	belongs_to :sub_category
	has_many :appointments
end
