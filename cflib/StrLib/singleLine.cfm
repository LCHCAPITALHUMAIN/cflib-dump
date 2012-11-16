function singleLine(s){
	s = replacelist(s, "#chr(9)#,#chr(10)#,#chr(12)#,#chr(13)#,#chr(160)#", " , , , , ");
	return trim(reReplace(s, "[[:space:]]{2,}", " ", "all"));
}