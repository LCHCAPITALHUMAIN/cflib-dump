function GetSchemeFromURL(this_url) {
	var i = 0;
	
	this_url = trim(this_url);
	
	i = Find("://", this_url, 1);
	if (i LT 1) {
		return ""; // relative url = no scheme   (ex: "../dir1/filename.html" or "/dir1/filename.html")
	} else {
		return Left(this_url, i+2);  // return the "://" and everything to the left of it
	}
}