class Booking < ApplicationRecord
	has_and_belongs_to_many :rooms
	belongs_to :member
	
end
