
require 'rails_helper'

describe "Search-by" do

	#########search by location

	context "location" do
	  	context "when location does not present"do
  		 	it "it should notify as location is not found..."do end
  		 end
		context "location is present"do
			context "check room availability "do
				context "when rooms are not available for given check_in and check_out dates"do
						it "it should return nil"do end
				end
				context "when rooms are available for given check_in and check_out dates"do
					it "it should return hotels list"do end
				end
			end
		end
	end

	context "hotel name" do
	  	context "when hotel name does not present"do
  		 	it "it should notify as hotel name is not found..."do end
  		 end
  		 context "when hotel name is present"do
  		 	context "check room availability "do
  		 		context "when rooms are not available for given check_in and check_out dates"do
						it "it should return nil"do end
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

end


	
