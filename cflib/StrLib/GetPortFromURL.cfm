function GetPortFromURL(this_url) {
	var re_found_struct = "";
	
	this_url = trim(this_url);
	
	re_found_struct = REFind("[^./].[^./:]+(:[[:digit:]]+)", this_url, 1, "True");

	if (re_found_struct.pos[1] GT 0) {
		return Mid(this_url, re_found_struct.pos[2]+1, re_found_struct.len[2]-1);
	} else {
		return "";
	}
}