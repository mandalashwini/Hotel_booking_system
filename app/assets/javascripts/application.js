
function search()
{
	var checkinDate=document.getElementById("checkinDate_").value;
	var checkoutDate=document.getElementById("checkoutDate_").value;

	if(checkoutDate<checkinDate){
		alert("checkin date must be greater than checkout date");
		window.location.reload();
	}
	else
	window.location="/search/searchHotelResult";
}