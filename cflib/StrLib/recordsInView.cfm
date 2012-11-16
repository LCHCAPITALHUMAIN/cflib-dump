function recordsInView(rowsPerPage,currentPage,recordCount){
	var first = "";
	var last = "";
	var output = "";
	if(currentPage eq 1){
		first = 1;
	}else{
		first = rowsPerPage*(currentPage - 1)+1;
	}
	if(rowsPerPage - ((currentPage*rowsPerPage) - recordCount) gt rowsPerPage){
		last = currentPage*rowsPerPage;
	}else{
		last = recordCount;
	}		
	
	if(first lt last){
		output = first & " to " & last & " of " & recordCount;
	}else if (first eq recordCount){
		output = first & " of " & recordCount;
	}else if (first gt recordCount){
		output = recordCount & " of " & recordCount;
	}
	return output;
}