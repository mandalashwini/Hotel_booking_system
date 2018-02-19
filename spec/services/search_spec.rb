
require 'rails_helper'


RSpec.describe Search_operations do
describe "Search-by" do

	#########search by location
  let(:params) {{checkinDate:"2/3/2018",checkoutDate:"6/3/2018",name_or_location:"pune"}}
	context "location or hotel name, checkinDate ,chekoutDate" do
      context "search for room availability on given checkinDate and chekoutDate "do
    	  	context "when rooms available"do
                  it "it should return hotels list" do
                        roomResult=Room.joins(:bookings).select("id").where('"checkinDate" BETWEEN ? AND ? OR "checkoutDate" BETWEEN ? AND ?',params[:checkinDate],params[:checkoutDate],params[:checkinDate],params[:checkoutDate])
                        hotelResult=Hotel.joins(:rooms).where.not(:rooms => {id: roomResult} ).where("name ILIKE ? OR location ILIKE ?","#{params[:name_or_location]}%","#{params[:name_or_location]}%").uniq
                        expect(hotelResult.empty?).to eql(true)
                  end
             end   
        end     
         context "when rooms are not available on given checkinDate and checkoutDate" do
               it "it should notify search not found"do end
         end

         context "when name_or_location not match" do
               it "it should notify search not found"do end
         end
         
     end
	 end

end
