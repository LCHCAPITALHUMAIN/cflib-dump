function parseInt(String){
	var NewString = "";
	var i = 1;

	for(i=1; i lt Len(String); i = i + 1) {
		if( isNumeric( mid(String,i,1) ) ) { newString = val( mid( String,i,Len(String) ) ); break;}
	}
	return NewString;
}