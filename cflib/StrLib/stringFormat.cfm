function stringFormat(str,msk){
	var i=0;
	var c=1;
	var r="";
	for(i=1;i LTE Len(msk);i=i+1){
		if(Find("X",mid(msk,i,1)) GT 0){
			if(c LTE Len(str)){
				r = r & mid(str,c,1);
				c = c + 1;
			}else{
				r = r & " ";
			}
		}else{
			r = r & mid(msk,i,1);
		}
	}
	return r;
}