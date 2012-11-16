function createCalendar(curMonth,curYear) {
	var outString = "";
	var firstDay = CreateDate(curYear, curMonth, 1);
	var firstDayDigit = DayOfWeek(FirstDay);
	var i = 1;
	var h = 1;
	var height = 40;
	var width = 60;
	var titleStyle = "";
	var numberStyle = "";

	if(arrayLen(arguments) gte 3) height = arguments[3];
	if(arrayLen(arguments) gte 4) width = arguments[4];	    
	if(arrayLen(arguments) gte 5) titleStyle = arguments[5];
	if(arrayLen(arguments) gte 6) numberStyle = arguments[6];
	
	outString = "<table border='1'><tr><td align=center colspan='7'  ";
	if(len(titleStyle)) outString = outString & "class='#titleStyle#'";
	outString = outString & ">#DateFormat(firstDay, 'mmmm')#</td></tr>";
	
	// if it isn't sunday, then we need to if space over to start on the corrent day of week
	if (firstDayDigit neq 1) {
		for (h=1; h lt DayOfWeek(FirstDay); h = h+1) {
			outString = outString & "<td>&nbsp;</td>";
		}
	}
	
	// loop thru all the dates in this month
	for (i=1; i lte DaysInMonth(firstDay); i = i+1) {
		//is it Sunday? if so start new row.
		if (DayOfWeek(CreateDate(curYear, curMonth, i)) eq 1) {
			outString = outString & "<tr>";
		}
		// insert a day
		outString = outString & "<td align='left' valign='top' width='#width#px' ";
		if(len(numberStyle)) outString = outString & "class='#numberStyle#' ";
		outString = outString & "height='#height#'>#i#<br></td> ";
		// is it the last day of the month?  if so, fill row with blanks.
		if (i eq DaysInMonth(firstDay)) {
			for (h=1; h lte (7-DayOfWeek(CreateDate(curYear, curMonth, i))); h = h+1) {
				outString = outString & "<td>&nbsp;</td>";
			}
		}
		if (DayOfWeek(CreateDate(curYear, curMonth, i)) eq 7){
			outString = outString & "</tr>";
		}
	}
	outString=outString & "</table>";
	return outString;
}