// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks

/*$(document).on('turbolinks:load', function(){
	 $(".chosen-select").chosen();
	})*/
/*	function search(){ 
		var name_or_location = document.getElementById('search_name_or_location').value;
		 var checkin = document.getElementById('search_checkin').value; 
		 var checkout = document.getElementById('search_checkout').value;
		  var xhttp = new XMLHttpRequest();
		   xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		     document.getElementById("results").innerHTML = this.responseText; 
		 }
	  };
  xhttp.open("GET", "/search/searchView?name_or_location="+name_or_location+"&checkin="+checkin+"&checkout="+checkout, true);
  xhttp.send();
}
*/
/*function search()
{
	var checkinDate=document.getElementById("checkinDate_").value;
	var checkoutDate=document.getElementById("checkoutDate_").value;

	if(checkoutDate<checkinDate){
		alert("checkin date must be greater than checkout date");
		window.location.reload();
	}
	else
	window.location="/search/searchHotelResult";
	xhttp.open("GET", "/search/searchView?name_or_location="+name_or_location+"&checkin="+checkin+"&checkout="+checkout, true);
}*/