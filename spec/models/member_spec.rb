require 'rails_helper'

RSpec.describe Member, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

	  #before(:each) do
	  #	@member=Member.create( firstName: "ashw",lastName: "mandal" ,mobileNumber: "8983401613", email: "ashu@gmail.com" ,password:"ashwini1");
	  #	  end	
 	let(:member)  { Member.new( firstName: "ashu",lastName: "mandal" ,mobileNumber: "8983401613", email: "ashu@gmail.com" ,password:"ashwini1") }
		####First Name validation ###
	describe "FirstName validation" do
		 name_REGEX = /\A[A-Za-z]+\Z/

			it " first name can't be blank" do
				member.firstName = nil
				member.save
				expect(member.errors.messages[:firstName][0]).to eql("can't be blank")
		   end

		   it "first name is invalid..numbers not allowed.." do
	    		 member.firstName="123"
				member.firstName.match(name_REGEX)
				member.save
				expect(member.errors.messages[:firstName]).to eql(["only allows letters"])
		   end

		    it " first name valid " do
		   		 member.firstName="abc"
			   	member.firstName.match(name_REGEX)
			expect((member.errors.messages[:firstName]).empty?).to eql(true)
		   end
	end
	######Last Name validation#####
	describe "lastName validation" do
		 name_REGEX = /\A[A-Za-z]+\Z/

			it " lastName name can't be blank" do
				member.lastName = nil
				member.save
				expect(member.errors.messages[:lastName][0]).to eql("can't be blank")
		   end

		   it "lastName is invalid..numbers not allowed.." do
	    		 member.lastName="123"
				member.lastName.match(name_REGEX)
				member.save
				expect(member.errors.messages[:lastName]).to eql(["only allows letters"])
		   end

		    it " lastName valid " do
		   		 member.lastName="abc"
			   	member.lastName.match(name_REGEX)
			   	member.save
			expect((member.errors.messages[:lastName]).empty?).to eql(true)
		   end
	end
	######Mobile Number####
	describe "MobileNumber validation" do
		 mb_REGEX = /\A[0-9]{10}+\Z/

			it " mobileNumber can't be blank" do
				member.mobileNumber = nil
				member.save
				expect(member.errors.messages[:mobileNumber][0]).to eql("can't be blank")
		   end

		   it "mobileNumber is invalid..Allows only 10 Digits" do
	    		 member.mobileNumber="123"
				member.mobileNumber.match(mb_REGEX)
				member.save
				expect(member.errors.messages[:mobileNumber]).to eql(["is invalid"])
		   end

		    it " mobileNumber is valid " do
		   		 member.mobileNumber="8983401613"
			   	member.mobileNumber.match(mb_REGEX)
			   	member.save
			expect((member.errors.messages[:mobileNumber]).empty?).to eql(true)
		   end
	end
	describe "Email validation" do
		 email_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i
			it " Email can't be blank" do
				member.email = nil
				member.save
				expect(member.errors.messages[:email][0]).to eql("can't be blank")
		   end

		   it "Email is not in proper format.." do
	    		 member.email="ashh"
				member.email.match(email_REGEX)
				member.save
				expect(member.errors.messages[:email][0]).to eql("is invalid")
		   end

		    it " Email is valid " do
		   		 member.email="ashu@gmail.com"
			   	member.email.match(email_REGEX)
			   		member.save
			expect((member.errors.messages[:email]).empty?).to eql(true)
		   end
	end
end
