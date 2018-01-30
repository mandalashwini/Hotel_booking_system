class Room < ApplicationRecord
	belongs_to :hotel
	has_many :images, as: :imageable

	validates :hotel_id ,presence: true
	
	rating_REGEX=/\A[0-9]+\Z/

   validates :price,presence: true
	
   validates_numericality_of :price, :only_integer => true, 
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 99999,
    :message => "accept only whole number between 1 and 99999."
    accepts_nested_attributes_for :images
end
