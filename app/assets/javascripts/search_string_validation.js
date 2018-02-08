var search_string_validate=(function()
{

	var str;
	function stringValidate()
	{
		searchString=document.getElementById("location").value;

		var strREX = "/\A[A-Za-z]+\Z/";
            if(searchString.match(strREX))
				alert(searchString);
	
	}
return{
	stringValidate:stringValidate
}

})();