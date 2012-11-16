// Replaces variable placeholders with variable values.
function RePlaceHolders(thisField,identifier){
	var start=1;
	var st="";
	var end="";
	var temp="";
	var tempVar="";
        var query = "";
	if (ArrayLen(arguments) EQ 3) {
		query="#arguments[3]#.";
	}
	for(i=1;i lte Len(thisField);i=i+1){
		st=#Find(identifier,thisField,start)#;
		if(st gt 0){
			end=#Find(identifier,thisField,st+1)#+1;
			ct=end-st;
			temp=Mid(thisField,st,ct);
			tempVar=evaluate("###query##ReplaceNoCase(temp,identifier,"","ALL")###");
			thisField=ReplaceNoCase(thisField,temp,tempVar,"ALL");
			if(Len(temp) gt Len(tempVar)){
				end=end-(Len(temp)-Len(tempVar));
			}else{
				end=end+(Len(tempVar)-Len(temp));
			}
			start=end+1;
		}
	}
	return thisField;
}