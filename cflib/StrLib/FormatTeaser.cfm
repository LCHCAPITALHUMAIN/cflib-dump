function FormatTeaser(string,number){
	var urlArgument = "";
	var shortString = "";
	
	//return quickly if string is short or no spaces at all
	if(len(string) lte number or not refind("[[:space:]]",string)) return string;
	
	if(arrayLen(arguments) gt 2) urlArgument = "... <a href=""" & arguments[3] & """>[more]</a>";

	//Full Left code (http://www.cflib.org/udf.cfm?ID=329)
	if(reFind("[[:space:]]",mid(string,number+1,1))) {
	  	shortString = left(string,number);
	} else { 
		if(number-refind("[[:space:]]", reverse(mid(string,1,number)))) shortString = Left(string, (number-refind("[[:space:]]", reverse(mid(string,1,number))))); 
		else shortString = left(str,1);
	}
	
	return shortString & urlArgument;

}