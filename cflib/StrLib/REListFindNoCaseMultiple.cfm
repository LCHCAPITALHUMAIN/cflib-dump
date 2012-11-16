function REListFindNoCaseMultiple(reg_expr,tlist){
 	var results="";
	var expr_location = 0;
	var i = 1;
	var delims = ",";
	
	if(arrayLen(arguments) gt 2) delims = arguments[3];
	
	for(; i lte listlen(tlist,delims); i=i+1){
	    expr_location = REFindNoCase(reg_expr,listgetat(tlist,i,delims));
	    if(expr_location gt 0) results=listappend(results,i);
	}    		
	return results;
}