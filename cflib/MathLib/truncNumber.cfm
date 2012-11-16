function truncNumber(input) {
	var decimals = 2;
	var regex = "";
	var st = "";
	if(arrayLen(arguments) EQ 2) decimals = arguments[2];
	regex = "^\d*(.\d{1," & decimals & "})?";
	st = reFind(regex,input,1,true);
	return mid(input,st.pos[1],st.len[1]);
}