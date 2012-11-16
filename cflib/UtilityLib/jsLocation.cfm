function jslocation(href) { 
	var frame = "window"; 
		
	if (arraylen(arguments) gte 2) { frame = arguments[2]; } 
		
	return "<script language=""javascript"" type=""text/javascript"">" 
		& frame & ".location.replace(""" & jsstringformat(href) & """);</script>";
}