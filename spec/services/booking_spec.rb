require 'rails_helper'

describe "In-booking" do

	context "user must be login with valid emailid and password" do
		context "When user is not logged in "do
			it "it should notify to login first.." do end
		end
		context "When user is logged in "do
			it "it should return login status"do end
		end
	end
	context "it should show room details"do
		context "it should make payment"do
			context "When payment done successfully" do
				it "it  should send booking confirmation mail to user"do end
			end
			context "When payment fail" do
				it "it  should notify fail to make payment"do end
			end
		end
	end
end