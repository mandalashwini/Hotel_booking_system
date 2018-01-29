require 'rails_helper'

RSpec.describe Member, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

	  before(:each) do
	  	@member=Member.create( firstName: "ashu",lastName: "mandal" ,mobileNumber: 8983401613, email: "ashu@gmail.com" ,password:"ashwini1");
	  	@member_firstname =Member.create( lastName: "mandal" ,mobileNumber: 8983401613, email: "ashu@gmail.com" ,password:"ashwini1");
	  	@member_lastname =Member.create( firstName: "ashu" ,mobileNumber: 8983401613, email: "ashu@gmail.com" ,password:"ashwini1");
	  	@member_mobilenumber =Member.create( firstName: "ashu" ,lastName: "mandal" , email: "ashu@gmail.com" ,password:"ashwini1");
	  	@member_email =Member.create( firstName: "ashu" ,lastName: "mandal",mobileNumber: 8983401613, password:"ashwini1");
	  	@member_password =Member.create( firstName: "ashu" ,lastName: "mandal",mobileNumber: 8983401613, email: "ashu@gmail.com" );
	  end	

	describe "validations" do
			it "require first name" do
				@member_firstname.save
				expect(@member_firstname).to be_valid
		   end


		   it "require last name" do
			   	@member_lastname.save
			   	expect(@member_lastname).to be_valid
		   end

		    it "require mobile number" do
			   	@member_mobilenumber.save
			   	expect(@member_mobilenumber).to be_valid
		   end


		   it "require email id" do
			   	@member_email.save
			   	expect(@member_email).to be_valid
		   end

		   it "require password" do
			   	@member_password.save
			   	expect(@member_password).to be_valid
		   end

		   it "success" do
			   	@member.save
			   	expect(@member).to be_valid
		   end

	end
end
