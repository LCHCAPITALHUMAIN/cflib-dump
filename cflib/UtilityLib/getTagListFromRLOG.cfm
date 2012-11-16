function getTagListFromRLOG( rlog )	{
		var myrlog = replace(arguments.rlog,'=============================================================================',chr(236),'All');
		var myArray = ListToArray(myrlog,chr(236));
		var myLength = ArrayLen(myArray);
		var startStr = 'symbolic names:';
		var endStr = 'keyword substitution:';
		var startPos = 0;
		var myLen = 0;
		var HDList = '';
		var i = '';
		var j = '';
		var tag = '';
		var hdArray = '';
		var hdArrayLen = 0;
	
		for(i=1; i LTE myLength; i = i +1)	{
			startPos = Find(startStr,myArray[i])+Len(startStr);
			myLen = Find(endStr,myArray[i]) - Find(startStr,myArray[i]) - Len(endStr);
			if( myLen GT 0 )	{
				hdArray = ListToArray(myArray[i],':');
				hdArrayLen = ArrayLen(hdArray);
				for(j=1; j LTE hdArrayLen; j = j + 1)	{
					if( Find('HD',hdArray[j]) )	{
						tag = Mid(hdArray[j],Find('HD',hdArray[j]), Len(hdArray[j]));
						if(NOT ListContains(HDList,tag,',') )
							HDList = ListAppend(HDList,tag);
					}
				
				}
			
			}
		
		}
		return HDList;
	}