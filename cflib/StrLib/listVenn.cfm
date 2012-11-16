function listVenn(ListA,ListB,ReturnListType){
	var i					= "";
	var ThisListItem		= "";
	var ListADelimeter		= ",";
	var ListBDelimeter		= ",";
	var ReturnListDelimeter	= ",";
	var ReturnList			= "";
	var TempListA			= ListA;
	var TempListB			= ListB;
	
	
	// Handle optional arguments
	switch(ArrayLen(arguments)) {
		case 4:
		{
			ListADelimeter	= Arguments[4];
			break;
		}
		case 5:
		{
			ListADelimeter		= Arguments[4];
			ListBDelimeter		= Arguments[5];        
			break;
		}       
		case 6:
		{
			ListADelimeter		= Arguments[4];
			ListBDelimeter		= Arguments[5];        
			ReturnListDelimeter = Arguments[6];
			break;
		}
 		}
	// change delimeters on both lists to match
	// couldn't get listchangedelims to work, otherwise I'd have used that.
	ListA = "";
	ListB = "";
	for (i = 1; i lte listlen(TempListA,ListADelimeter); i = i + 1){
		ThisListItem = listgetat(TempListA,i,ListADelimeter);
		ListA = ListAppend(ListA,ThisListItem,ReturnListDelimeter);
	}
	for (i = 1; i lte listlen(TempListB,ListBDelimeter); i = i + 1){
		ThisListItem = listgetat(TempListB,i,ListBDelimeter);
		ListB = ListAppend(ListB,ThisListItem,ReturnListDelimeter);
	}

	// A and B (aka Intersection)
	if (ReturnListType eq "AandB"){
		for(i = 1; i lte listlen(ListA,ReturnListDelimeter); i = i + 1){
			ThisListItem = listgetat(ListA,i,ReturnListDelimeter);
			if (ListFindNoCase(ListB,thisListItem,ReturnListDelimeter)){
				ReturnList = ListAppend(ReturnList,ThisListItem,ReturnListDelimeter);
			}
		}
	}
	// A or B (aka Union)
	else if(ReturnListType eq "AorB"){
		ReturnList = ListA;
		ReturnList = ListAppend(ReturnList,ListB,ReturnListDelimeter);
		
	}
	// A not B
	else if (ReturnListType eq "AnotB"){
		for(i = 1; i lte listlen(ListA,ReturnListDelimeter); i = i + 1){
			ThisListItem = listgetat(ListA,i,ReturnListDelimeter);
			if (not ListFindNoCase(ListB,thisListItem,ReturnListDelimeter)){
				ReturnList = ListAppend(ReturnList,ThisListItem,ReturnListDelimeter);
			}
		}
	}
	// B not A
	else if (ReturnListType eq "BnotA"){
		for(i = 1; i lte listlen(ListB,ReturnListDelimeter); i = i + 1){
			ThisListItem = listgetat(ListB,i,ReturnListDelimeter);
			if (not ListFindNoCase(ListA,thisListItem,ReturnListDelimeter)){
				ReturnList = ListAppend(ReturnList,ThisListItem,ReturnListDelimeter);
			}
		}
	}
	return ReturnList;
}