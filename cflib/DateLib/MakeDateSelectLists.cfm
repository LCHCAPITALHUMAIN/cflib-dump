function MakeDateSelectLists(NameList, StartYear, EndYear) {
	var out_string  = "";
	var i           = 1;
	var theDelim    = ",";
	var CR          = chr(13);
	var defaultDate = now();
	
	if(arrayLen(arguments) gte 4) defaultDate = arguments[4];
	if(ArrayLen(Arguments) GTE 5) theDelim = Arguments[5];

	// Month
	out_string = "<select name='#ListFirst(NameList, theDelim)#'>#CR#";
	for(i=1; i LTE 12; i=i+1){
		if(i EQ Month(DefaultDate)){
			out_string  = out_string & "<option value='#i#' selected>#MonthAsString(i)#</option>#CR#";
		} else {
			out_string  = out_string & "<option value='#i#'>#MonthAsString(i)#</option>#CR#";
		}
	}
	out_string = out_string & "</select>#CR##CR#";

	// Day
	out_string = out_string & "<select name='#ListGetAt(NameList, 2, theDelim)#'>#CR#";
	for(i=1; i LTE 31; i=i+1){
		if(i EQ Day(DefaultDate)){
			out_string  = out_string & "<option value='#i#' selected>#i#</option>#CR#";
		} else {
			out_string  = out_string & "<option value='#i#'>#i#</option>#CR#";
		}
	}
	out_string = out_string & "</select>#CR##CR#";

	// Year
	out_string = out_string & "<select name='#ListLast(NameList, theDelim)#'>#CR#";
	for(i = StartYear; i LTE EndYear; i=i+1){
		if(i EQ Year(DefaultDate)){
			out_string  = out_string & "<option value='#i#' selected>#i#</option>#CR#";
		} else {
			out_string  = out_string & "<option value='#i#'>#i#</option>#CR#";
		}
	}
	out_string = out_string & "</select>#CR##CR#";


	return out_string;
}