function form2qs() {
	var str = "";
	var field = "";
	for(key in form) {
		str = str & "&#key#=" & urlEncodedFormat(form[key]);
	}
	return str;	
}