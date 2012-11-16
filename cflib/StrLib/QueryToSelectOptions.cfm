function QueryToSelectOptions(theQuery, ValueField) {
	var out_string  = "";
	var row         = 1;
	var CR          = chr(13);
	var DisplayField = ValueField;
	var Selected    = "";
	
	if(ArrayLen(Arguments) gte 3) DisplayField = Arguments[3];
	
	if(ArrayLen(Arguments) GTE 4) Selected = Arguments[4];

	for(row=1; row LTE theQuery.recordCount; row=row+1){
		if ((Selected NEQ "") and (theQuery[DisplayField][row] EQ Selected)) {
			out_string  = out_string & "<option value=""#Replace(theQuery[ValueField][row], """", "&quot;", "ALL")#"" selected>#ReplaceList(theQuery[DisplayField][row], "<,>", "&lt;,&gt;")#</option>#CR#";
		} else {
			out_string  = out_string & "<option value=""#Replace(theQuery[ValueField][row], """", "&quot;", "ALL")#"">#ReplaceList(theQuery[DisplayField][row], "<,>", "&lt;,&gt;")#</option>#CR#";
		}
	}

	return out_string;
}