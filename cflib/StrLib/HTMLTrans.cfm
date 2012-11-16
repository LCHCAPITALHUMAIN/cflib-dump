function HTMLTrans(string) {
	var slen = len(string);
	var encoded = "";

	while (slen) {
		encoded = encoded & "&##" & Asc(left(string,1)) & ";";
		string = mid(string,2,slen-1);
		slen=len(string);
	}
	return encoded;
}