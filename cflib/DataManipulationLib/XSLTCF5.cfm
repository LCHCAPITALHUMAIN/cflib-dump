function xsltcf5(source,style){
	// Instantiate COM Objects
	var objSource=CreateObject("COM", "Microsoft.XMLDOM", "INPROC");
	var objStyle=CreateObject("COM", "Microsoft.XMLDOM", "INPROC");
	var sourceReturn = "";
	var styleReturn = "";
	var styleRoot = "";
	var xsloutput = "";
	// Parse XML
	objSource.async = "false";
	sourceReturn = objSource.load("#source#");
	// Parse XSL
	objStyle.async = "false";
	styleReturn = objStyle.load("#style#");
	// Transform Document 
	styleRoot = objStyle.documentElement;
	xsloutput = objSource.transformNode(styleRoot);
	// Output Results
	return xsloutput;
}