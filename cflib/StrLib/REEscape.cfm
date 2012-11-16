function REEscape(theString){
	var special_char_list      = "\,+,*,?,.,[,],^,$,(,),{,},|,-";
	var esc_special_char_list  = "\\,\+,\*,\?,\.,\[,\],\^,\$,\(,\),\{,\},\|,\-";
	return ReplaceList(theString, special_char_list, esc_special_char_list);
}