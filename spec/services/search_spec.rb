
require 'rails_helper'

describe "Search-by" do

	#########search by location

	context "location" do
	  	context "when location does not present"do
  		 	it "it should notify as location not found..."do end
  		 end

		context "when location is present"do
			context "it should check for room availability "do
				context "when rooms are not available for given check_in and check_out dates"do
						it "it should notify as rooms are not available"do end
				end
				context "when rooms are available for given check_in and check_out dates"do
					it "it should return hotels list"do end
				end
			end
		end
	end

	context "hotel name" do
	  	context "when hotel name does not present"do
  		 	it "it should notify as hotel name not found..."do end
  		 end

  		 context "when hotel name is present"do
  		 	context "it should check for room availability  "do
  		 		context "when rooms are not available for given check_in and check_out dates"do
						it "it should notify as rooms are not available"do end
				end
				context "when rooms are available for given check_in and check_out dates"do
					it "it should return rooms list"do end
				end
			end
  		 end
  	end

	context "rating" do
	  	context "when rating does not match with any hotel rating"do
  		 	it "it should notify no hotel found with the given rating..."do end
  		 end

  		 context "when rating does  match "do
  			 it "it should return Hotels list" do end
  		 end
  	end

  	context "room_price" do
  		context "When rooms are available on given price range"do
  			it "it should return rooms list"do end
  		end
  		context "When rooms are not available on given price range" do
  			it "it should notify rooms are not available on given price range"do end
  		end
  	end


  	context "room_type" do
  		context "When rooms are available on given type"do
  			it "it should return rooms list"do end
  		end
  		context "When rooms are not available on given type" do
  			it "it should notify rooms are not available on given type"do end
  		end
  	end
end


	
