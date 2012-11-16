function ISOYear(inputDate) {
	var inputDay = dayOfWeek(inputDate);
	var yearNo = year(inputDate);
	
	/** If the inputdate IS 29th-31st December, the input year MAY need to be next year **/
	if((dateFormat(inputDate,"ddmm") is "2912" and dayOfWeek(inputDate) eq 2)
	or (dateFormat(inputDate,"ddmm") IS "3012" and listFind("2,3",dayOfWeek(inputDate),",") gt 0)
	or (dateFormat(inputDate,"ddmm") IS "3112" and listFind("2,3,4",dayOfWeek(inputDate),",") gt 0))
	{yearNo=year(inputDate)+1;}
	
	/** If the inputdate IS 1st - 3rd January, the input year MAY need to be previous year **/
	if((dateFormat(inputDate,"ddmm") is "0301" and dayOfWeek(inputDate) eq 1)
	or (dateFormat(inputDate,"ddmm") IS "0201" AND listFind("1,7",dayOfWeek(inputDate),",") gt 0)
	or (dateFormat(inputDate,"ddmm") IS "0101" and listFind("1,7,6",dayOfWeek(inputDate),",") gt 0))
	{yearNo=year(inputDate)-1;}
	
	return yearNo;
}