function DumpVar(varToProcess){
		var structLoopCount = 0;
		var LoopCount = 0;
		var ObjSize = 0;
		var key = "";
        var keys = "";
		var numOfColumns = 0;
        var count2 = 0;
        
		var StartString = "";
		var EndString = "</table>#chr(10)#";
		if(isSimpleValue(varToProcess)){
			if(isWDDX(varToProcess)){
				StartString = "#chr(10)#<table bordercolor='black' border='1' cellspacing='0' cellpadding='1'>#chr(10)#";
				
				return StartString & "<tr>#chr(10)#<td>WDDX currently not displayable</td>#chr(10)#</tr>#chr(10)#" & EndString;
			}else{
				return varToProcess;
			}
		}else if(isArray(varToProcess)){
			StartString = "#chr(10)#<table bordercolor='##008000' border='1' cellspacing='0' cellpadding='1'>#chr(10)#";
			ObjSize = ArrayLen(varToProcess);
			
			for(LoopCount = 1;LoopCount LTE ObjSize;LoopCount = LoopCount + 1){
				StartString = StartString & "<tr>#chr(10)#<td bgcolor='##cceecc' valign='top'>#LoopCount#</td><td>#dumpVar(varToProcess[LoopCount])#</td>#chr(10)#</tr>#chr(10)#";
			}
			return StartString & EndString;
		}else if(isStruct(varToProcess)){
			StartString = "#chr(10)#<table bordercolor='blue' border='1' cellspacing='0' cellpadding='1'>#chr(10)#";
			
			for(key in varToProcess){
				StartString = StartString & "<tr>#chr(10)#<td bgcolor='##aaaaee' valign='top'>#key#</td>#chr(10)#<td>#dumpVar(varToProcess[key])#</td>#chr(10)#</tr>#chr(10)#";
			}
			return StartString & EndString;
		}else if(isQuery(varToProcess)){
			StartString = "#chr(10)#<table bordercolor='red' border='1' cellspacing='0' cellpadding='1'>#chr(10)#";
			ObjSize = varToProcess.recordCount;
			Keys = varToProcess.columnList;
			numOfColumns = ListLen(Keys);
			StartString = StartString & "<tr>#chr(10)#";
			
			for(count2 = 1;count2 LTE numOfColumns;count2 = count2 + 1){
				StartString = StartString & "<td bgcolor='##eeaaaa'>#listGetAt(Keys,count2)#</td>#chr(10)#";
			}
			StartString = StartString & "</tr>#chr(10)#";
			
			for(LoopCount = 1;LoopCount LTE ObjSize;LoopCount = LoopCount + 1){
				StartString = StartString & "<tr>#chr(10)#";
				for(count2 = 1;count2 LTE numOfColumns;count2 = count2 + 1){
					StartString = StartString & "<td>#varToProcess[listGetAt(Keys,count2)][loopCount]#</td>#chr(10)#";
				}
				StartString = StartString & "</tr>#chr(10)#";
			}
			return StartString & EndString;
		}else{
			return " ";
		}
}