class Booking < ApplicationRecord
	has_and_belongs_to_many :rooms
	belongs_to :member

	validates :checkinDate, :on_or_after => lambda { Date.current }
	validates :checkoutDate, :after => lambda { :checkinDate }
  # 	scope :bookingId,->(checkinDate,checkoutDate,bookingDate){"insert into booking(checkinDate,checkoutDate,bookingDate)values(?,?,?)",checkinDate,checkoutDate,bookingDate}
  end