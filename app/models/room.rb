class Room < ApplicationRecord
	belongs_to :hotel
	validates :hotel_id ,presence: true
	#validates :price,:status,presence: true
    validates :price, :presence => true, :length => { :minimum =>2 ,:maximum =>5} 
     enum status: { active: 0, inactive: 1, not_sure: 2, prefer_not_to_disclose: 3 }
end
