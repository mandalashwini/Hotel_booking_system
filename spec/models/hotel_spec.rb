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

		   it "hotel name is invalid..only allows letters" do
	    		   hotel.name="123"
			   hotel.name.match(name_REGEX)
			   hotel.save
				expect(hotel.errors.messages[:name]).to eql(["only allows letters"])
		   end

		    it " hotel name valid " do
		   		   hotel.name="11abc"
			      hotel.name.match(name_REGEX)
			expect((hotel.errors.messages[:name]).empty?).to eql(true)
		   end
	end


describe "Hotel Location validation" do
		 name_REGEX1 = /\A[A-Za-z]+\Z/

			it " hotel location can't be blank" do
				hotel.location = nil
				hotel.save
				expect(hotel.errors.messages[:location][0]).to eql("can't be blank")
		   end

		   it "hotel location is invalid.." do
	    		   hotel.location="123"
			   hotel.location.match(name_REGEX1)
			   hotel.save
				expect(hotel.errors.messages[:location]).to eql(["is invalid"])
		   end

		    it " hotel name valid " do
		   		   hotel.location="11abc"
			      hotel.location.match(name_REGEX1)
			expect((hotel.errors.messages[:location]).empty?).to eql(true)
		   end
	end


	describe "Hotel rating validation" do
		 rt_REGEX = /\A[0-9]{1}+\Z/
		   it " hotel rating can't be blank" do
				hotel.rating = nil
				hotel.save
				expect(hotel.errors.messages[:rating][0]).to eql("can't be blank")
		   end

		   it "hotel rating is invalid..accept only whole number between 1 and 10." do
	    	   hotel.rating="123"
			   #hotel.rating
			   hotel.save
				expect(hotel.errors.messages[:rating]).to eql(["accept only whole number between 1 and 10."])
		   end

		    it " hotel rating valid " do
		   		   hotel.rating="11abc"
			    #  hotel.rating.match(rt_REGEX)
			expect((hotel.errors.messages[:rating]).empty?).to eql(true)
		   end
			
	end
end
