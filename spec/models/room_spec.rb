require 'rails_helper'

RSpec.describe Room, type: :model do
  

  let(:room)  { Room.new( hotel_id: 2,room_type:"AC",room_price:2500,number_bedrooms:3)}
	describe "Room validation" do
			
			it "hotel_id can't be blank" do
				room.hotel_id=""
				room.save
				expect(room.errors.messages[:hotel_id]).to eql(["can't be blank"])
		   end

		   	it "room_type can't be blank" do
		   		room.room_type=""
		   		room.save
		   		expect(room.errors.messages[:room_type]).to eql(["can't be blank"])
		   end

		   it "number_bedrooms can't be blank" do
		   		room.number_bedrooms=""
		   		room.save
		   	    expect(room.errors.messages[:number_bedrooms]).to eql(["can't be blank"])
		   	end
		   	it "room price can't be blank" do
		   		room.room_price=""
		   		room.save
		   		expect(room.errors.messages[:room_price]).to eql(["can't be blank", "accepts only whole number between 1 and 99999."]
)
		   	end

		    it "room price accepts only whole number between 1 and 99999" do
		   		room.room_price="abc"
		   		room.save
		   		expect(room.errors.messages[:room_price]).to eql( ["accepts only whole number between 1 and 99999."])
		   	end
		   	   	
	end
		   

end
