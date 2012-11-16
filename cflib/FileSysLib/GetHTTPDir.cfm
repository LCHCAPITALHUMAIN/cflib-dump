function GetHTTPDir() {
        var format = "";
	if (arraylen(arguments)) {
	 format = arguments[1];
		if (format EQ 'full') {
			return "http://#cgi.server_name##listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
		}
		else if (format EQ 'relative') {
			return "#listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
		}
		else {
			return 'invalid argument';
		}
	}
	else {
		return "#listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
	}
}