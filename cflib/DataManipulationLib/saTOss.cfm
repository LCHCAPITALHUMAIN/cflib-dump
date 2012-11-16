function saTOss(struct,thekey){
	var x = "";
	var i = ""; 
	var ii = ""; 
	var new = structnew();
	var cols = structkeyarray(Struct); 

	if(arrayLen(arguments) GT 2) cols = listToArray(arguments[3]);
	
	for(i = 1; i lte arraylen(Struct[thekey]); i = i + 1){
		new[Struct[thekey][i]] = structnew();
		for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
			new[Struct[thekey][i]][cols[ii]] = Struct[cols[ii]][i];
		}
	}
	return new;
}