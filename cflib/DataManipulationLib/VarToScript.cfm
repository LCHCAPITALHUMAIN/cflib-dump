function VarToScript(lObj,lName) {
	var i="";
	var j="";
	var k="";
	var l="";
	var crlf=chr(13) & chr(10);
	var s="";
	var t="";
	var u='",##';
	var v='"",####';

	if (IsStruct(lObj)) {
		s = s & crlf & lName & "=StructNew();";
		for (i IN lObj) {
			if (IsSimpleValue( lObj[i] )) {
				s = s & crlf & lName & "[""" & i & """]=""" & ReplaceList(lObj[i],u,v) & """;";
			} else {
				s = s & varToScript(lObj[i], lName & "[""" & i & """]");
			}
		}

	} else if (IsArray(lObj)) {
		s = s & crlf & lName & "=ArrayNew(1);";
		for(i=1; i LTE ArrayLen(lObj); i=i+1) {
			if (IsSimpleValue( lObj[i] )) {
				s = s & crlf & lName & "[" & i & "]=""" & ReplaceList(lObj[i],u,v) & """;";
			} else {
				s = s & varToScript(lObj[i], lName & "[""" & i & """]");
			}
		}

	} else if (IsQuery(lObj)) {
		l = lObj.columnList;

		s = s & crlf & lName & "=QueryNew(""" & l & """);";
		s = s & crlf & "QueryAddRow(" & lName & ", " & lObj.recordcount & ");";

		for(i=1; i LTE lObj.recordcount; i=i+1) {
			for(j=1; j LTE ListLen(l); j=j+1) {
				k = lObj[ListGetAt(l,j)][i];
				if (IsSimpleValue(k)) {
					s = s & crlf & "QuerySetCell(" & lName & ",""" & ListGetAt(l,j) & """, """ & ReplaceList(k,u,v) & """," & i & ");";
				} else {
					t = "request.var2script_" & Replace(CreateUUID(),'-','_','all');
					s = s & crlf & "QuerySetCell(" & lName & ",""" & ListGetAt(l,j) & """, " & t & "," & i & ");";
					s = varToScript(k, t) & s;
					s = s & crlf & "StructDelete(variables,""#t#"");";
				}
			}
		}

	} else if (IsSimpleValue(lObj)) {
		s = s & crlf & lName & "=""" & ReplaceList(lObj,u,v) & """;";

	} else if (IsCustomFunction(lObj)) {
		s = s & crlf & "/* " & lName & " is a custom fuction, but i can't cfscript it */";

	} else {
		s = s & crlf & "/* " & lName & " - not sure what it is.... */";
	}

	return s;
}