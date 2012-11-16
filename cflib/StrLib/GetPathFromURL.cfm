function GetPathFromURL(this_url) {
	var first_char        = "";
	var re_found_struct   = "";
	var path              = "";
	var i                 = 0;
	var cnt               = 0;
	
	this_url = trim(this_url);
	
	first_char = Left(this_url, 1);
	if (Find(first_char, "./")) {
		// relative URL (ex: "../dir1/filename.html" or "/dir1/filename.html")
		re_found_struct = REFind("[^##\?]+", this_url, 1, "True");
	} else if(Find("://", this_url)){
		// absolute URL    (ex: "ftp://user:pass@ftp.host.com")
		re_found_struct = REFind("/[^##\?]*", this_url, Find("://", this_url)+3, "True");
	} else {
		// abbreviated URL (ex: "user:pass@ftp.host.com")
		re_found_struct = REFind("/[^##\?]*", this_url, 1, "True");
	}
	
	if (re_found_struct.pos[1] GT 0)  {
		// get path with filename (if exists)
		path = Mid(this_url, re_found_struct.pos[1], re_found_struct.len[1]);
		
		// chop off the filename
 		if(find("/", path)) {
			i = len(path) - find("/" ,reverse(path)) +1;
			cnt = len(path) -i;
			if (cnt LT 1) cnt =1;
			if (REFind("[^##\?]+\.[^##\?]+", Right(path, cnt))){
				// if the part after the last slash is a file name then chop it off
				path = Left(path, i);
			}
		}
		return path;
	} else {
		return "";
	}
}