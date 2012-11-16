function versionThis(str){
	str = replace(str,".","","all") + 1;
	str = left(str,len(str) - 2) & "." & mid(str,len(str)-1,1) & "." & right(str,1);
	return str;
}