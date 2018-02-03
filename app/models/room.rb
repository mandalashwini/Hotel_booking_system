class Room < ApplicationRecord
	belongs_to :hotel
	has_many :images, as: :imageable,dependent: :destroy

	validates :hotel_id ,presence: true
	validates :room_type ,presence: true
	validates :number_bedrooms ,presence: true
	
	rating_REGEX=/\A[0-9]+\Z/

   validates :room_price,presence: true
	
   validates_numericality_of :room_price,
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 99999,
    :message => "accept only whole number between 1 and 99999."
     accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes[:image].nil? }
end
