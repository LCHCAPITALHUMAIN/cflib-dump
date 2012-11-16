function HideLink(href, display, caption) {

	var str = "";
	
	str = "<a href=""#XMLFormat(href)#"" onmouseover=""window.status='#XMLFormat(display)#'; return true;"" onmouseout=""window.status=''; return true;""";
	str = str & ">";
	str = str & "#caption#</a>";
	
	return str;
	
}