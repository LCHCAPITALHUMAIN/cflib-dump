function breadCrumb() {
	var baseLink = "/";
	var delimiter = " > ";
	var crumbs = "<a href='" & baseLink & "'>Home</a>" & delimiter;
	var breadCrumbArray = listToArray(replace(cgi.script_name, "_", " ", "all") , "/");
	var i = 1;
	
	for(i=1; i lt arrayLen(breadCrumbArray); i=i+1) {
		baseLink = baseLink & replace(breadCrumbArray[i], " ", "_", "all") & "/";
		
		if(i lt ArrayLen(breadCrumbArray)-1) crumbs = crumbs & "<a href='" & baseLink & "'>" & capFirstTitle(breadCrumbArray[i]) & "</a>" & delimiter;
		else crumbs = crumbs & capFirstTitle(breadCrumbArray[i]);		
	}
	return crumbs;
}