require 'rails_helper'

RSpec.describe Hotel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  name_REGEX = /\A[A-Za-z0-9 ]+[A-Za-z ]+[a-zA-Z0-9]+\Z/
	rating_REGEX=/\A[0-9]{1}+\Z/
	location_REGEX = /\A[A-Za-z]+\Z/

	let(:hotel)  { Hotel.new( name: "Taj",rating:2,location: "solapur")}

	describe "Hotel Name validation" do
		 name_REGEX = /\A[A-Za-z0-9 ]+[A-Za-z ]+[a-zA-Z0-9]+\Z/

			it " hotel name can't be blank" do
				hotel.name = nil
				hotel.save
				expect(hotel.errors.messages[:name][0]).to eql("can't be blank")
		   end

		   it "hotel name is invalid.." do
	    		   hotel.name="123"
			   hotel.name.match(name_REGEX)
			   hotel.save
				expect(hotel.errors.messages[:name]).to eql(["is invalid"])
		   end

		    it " hotel name valid " do
		   		   hotel.name="11abc"
			      hotel.name.match(name_REGEX)
			expect((hotel.errors.messages[:name]).empty?).to eql(true)
		   end
	end

end
