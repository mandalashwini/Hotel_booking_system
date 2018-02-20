require 'rails_helper'

describe "booking service" do
	 let(:params) {{checkinDate:"2/3/2018",checkoutDate:"6/3/2018",roomsList:[52,53]}}
	 let(:params1) {{checkinDate1:"2/3/2018",checkoutDate1:"6/3/2018",bookingDate1:"20/3/2018",member_id:51}}
	context "user must be login with valid emailid and password" do
		context "When user is not logged in "do
					it "it should redirect to login page" do
		   		 	end
		end
		context "When user is logged in "do
			context "should check whether room has been already booked or not"do
				context "when rooms are not book" do
					it "it should create new booking record and associate corresponding rooms"do
					  	searchRoomExist=Room.joins(:bookings).where(:bookings=>{checkinDate: params[:checkinDate],checkoutDate: params[:@checkoutDate]},id:params[:roomsList]).uniq
					  	expect(searchRoomExist.empty?).to eql(true)
					    newBooking=Booking.create(checkinDate: params1[:checkinDate1],checkoutDate: params1[:checkoutDate1],bookingDate: params1[:bookingDate1],member_id: params1[:member_id])
					    rooms=Room.where(id:params[:roomsList])
		                newBooking.rooms << rooms
		            end     
				end
				context "when room are already booked" do
						it"it should notify"do

						end
				end
			end
		end
	end
end