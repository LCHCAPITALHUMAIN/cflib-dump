function fullLeft(str, count) {
	if (not refind("[[:space:]]", str) or (count gte len(str)))
		return Left(str, count);
	else if(reFind("[[:space:]]",mid(str,count+1,1))) {
	  	return left(str,count);
	} else { 
		if(count-refind("[[:space:]]", reverse(mid(str,1,count)))) return Left(str, (count-refind("[[:space:]]", reverse(mid(str,1,count))))); 
		else return(left(str,1));
	}
}