class Booking < ApplicationRecord
	has_and_belongs_to_many :rooms
  # 	scope :bookingId,->(checkinDate,checkoutDate,bookingDate){"insert into booking(checkinDate,checkoutDate,bookingDate)values(?,?,?)",checkinDate,checkoutDate,bookingDate}
  end