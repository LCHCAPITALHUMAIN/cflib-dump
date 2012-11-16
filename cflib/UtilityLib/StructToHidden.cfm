function structToHidden(struct){
	//a variable for iterating
	var key = "";
	//a variable to return stuff
	var outVar = "";
	//now loop through the form scope and make hidden fields
	for(key in struct){
		if(isSimpleValue(struct[key]))
			outVar = outVar & "<input type=""hidden"" name=""" & key & """ value=""" & htmlEditFormat(struct[key]) & """>";
	}
	return outVar;		
}