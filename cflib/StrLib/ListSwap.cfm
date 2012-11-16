function ListSwap(list, PositionA, PositionB)
{
	var elementA = "";
	var elementB = "";
	var Delims = ",";

	if (ArrayLen(Arguments) gt 3)
		Delims = Arguments[4];
			
	if (PositionA gt ListLen(list) Or PositionB gt ListLen(list) Or PositionA lt 1 or PositionB lt 1)
		return list;	
	
	elementA = ListGetAt(list, PositionA, Delims);
	elementB = ListGetAt(list, PositionB, Delims);
	
	//do the swap
	list = ListSetAt(list, PositionA, elementB, Delims);
	list = ListSetAt(list, PositionB, elementA, Delims); 

	return list;
}