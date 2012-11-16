function WordInstance(word,string){
	var i=0;
	var start=1;
	var j = 1;
	var tmp = "";
	
	string = " " & string & " ";
	for(j=1;j lte Len(string);j=j+1){
		tmp=REFindNoCase("[^a-zA-Z]+#word#[^a-zA-Z]+",string,start);
		if(tmp gt 0){
			i=i+1;
			start=tmp+Len(word);
		}else{
			start=start+1;
		}
	}
	return i;
}