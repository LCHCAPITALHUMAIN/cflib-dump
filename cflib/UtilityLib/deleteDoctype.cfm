function deleteDoctype() {
	var str = getPageContext().getOut().getString();
	str = reReplace(str,"<!DOCTYPE[^>]*>","","ONE");
	getPageContext().popBody().clearBuffer();
	writeOutput(str);
}