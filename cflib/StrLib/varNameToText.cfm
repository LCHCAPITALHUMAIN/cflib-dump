function varNameToText(str) {
	var words = "";
	var i = "";
	var output="";

	str = reReplace(str,"([.^[:upper:]])", " \1","all");
	str = reReplace(str,"([.^_])", " ","all");
	words = ListToArray(str, " ");	
	for(i=1; i LTE (ArrayLen(Words)); i=i+1){
		words[i] = ucase(mid(words[i],1, 1)) & mid(words[i],2, len(words[i])-1);
	}
	output = arrayToList(words, " ");		
	return output;
}