function CountIt(str, c) {
	var pos = findnocase(c, str, 1);
	var count = 0;

	if(c eq "") return 0;
	
	while(pos neq 0){
		count = count + 1;
		pos = findnocase(c, str, pos+len(c));
	}
	
	return count;
}