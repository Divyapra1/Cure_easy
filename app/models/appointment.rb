class Appointment < ApplicationRecord
	belongs_to :user
	belongs_to :catalogue
	validates :select_date, presence: true
	validates :select_time, presence: true
	validate :future_event
	enum status: [:Incomplete ,:Complete ]
	has_many_attached :picture

	private
	 def future_event
       errors.add(:select_date, "Can't be in the past Date!") if select_date < Time.now
	 end
end
