function submitButton(name,value) {
	var class="";
    var width="";
	var onClick="";
	
	if (arrayLen(arguments) gte 3) {class = " class=""#arguments[3]#""";}
	if (arrayLen(arguments) gte 4) {width = " width=""#arguments[4]#"" style=""width:#arguments[4]#px""";}
	if (arrayLen(arguments) gte 5) {onClick = " onClick=""#arguments[5]#""";}	
	return "<input type=""submit"" name=""#name#"" value=""#value#""#width##class##onClick#>";
}