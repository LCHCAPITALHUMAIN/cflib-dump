function deAccent(str){
	var newstr = "";
    var list1 ="�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�";
    var list2 = "a,e,i,o,y,u,a,e,i,o,u,a,e,i,o,u,a,n,o,a,e,i,o,u,y,A,E,I,O,U,A,E,I,O,U,Y,A,E,I,O,U,A,N,O,A,E,I,O,U,Y";
    
    newstr = ReplaceList(str,list1,list2);
    return newstr;
}