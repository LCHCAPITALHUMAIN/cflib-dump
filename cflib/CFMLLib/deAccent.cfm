function deAccent(str){
	var newstr = "";
    var list1 ="á,é,í,ó,ú,ý,à,è,ì,ò,ù,â,ê,î,ô,û,ã,ñ,õ,ä,ë,ï,ö,ü,ÿ,À,È,Ì,Ò,Ù,Á,É,Í,Ó,Ú,Ý,Â,Ê,Î,Ô,Û,Ã,Ñ,Õ,Ä,Ë,Ï,Ö,Ü,Ÿ";
    var list2 = "a,e,i,o,y,u,a,e,i,o,u,a,e,i,o,u,a,n,o,a,e,i,o,u,y,A,E,I,O,U,A,E,I,O,U,Y,A,E,I,O,U,A,N,O,A,E,I,O,U,Y";
    
    newstr = ReplaceList(str,list1,list2);
    return newstr;
}