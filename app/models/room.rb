class Room < ApplicationRecord
	belongs_to :hotel
	validates :price,:status,presence: true
end
