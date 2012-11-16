function showPagination(uri,uriPageVar,totalPages,currentPage,activeClass,separator,balanceEllipsisAt,showFirstLast,showPrevNext){
		var output = "";
		var beginAt = 1;
		var resumeAt = 0;
		var moveFirst ="&laquo;";
		var moveLast ="&raquo;";
		var moveNext ="&gt;";
		var movePrev ="&lt;";
		var i = "";
		
		var args = ArrayLen(arguments); 
		if(balanceEllipsisAt lt totalPages/2){
			beginAt = (currentPage - balanceEllipsisAt) + 2;
			if(beginAt lt 1) beginAt = 1;
			resumeAt = totalPages - balanceEllipsisAt;
		}
		
		if(showFirstLast eq 1 and currentPage gt balanceEllipsisAt-1){
			output = output & "<a href=""" & uri & "?" & uriPageVar & "=1"""">" & moveFirst & "</a> ";
		}
		if(showPrevNext eq 1 and currentPage neq 1){
			output = output & "<a href=""" & uri & "?" & uriPageVar & "=" & currentPage-1 & """>" & movePrev & "</a> ";
		}
		for(i = 1;i lte totalPages;i=i+1){				
			if((i gte beginAt AND i lte (balanceEllipsisAt+beginAt-1)) OR (i gt resumeAt)){		
				if(i gt beginAt OR beginAt gte totalPages-(balanceEllipsisAt-1)){
					output = output & separator;
				}
				output = output & "<a href=""" & uri & "?" & uriPageVar & "=" & i & """";
				if(i eq currentPage){
					output = output & "class=""" & activeClass & """";
				}
				output = output & ">" & i & "</a>";
			}else if(i eq resumeAt){
				output = output & " ... ";
			}			
		}
		if(showPrevNext eq 1 and currentPage neq totalPages){
			output = output & " <a href=""" & uri & "?" & uriPageVar & "=" & currentPage+1 & """>" & moveNext & "</a> ";
		}
		if(showFirstLast eq 1 and currentPage neq totalPages){
			output = output & " <a href=""" & uri & "?" & uriPageVar & "=" & totalPages & """>" & moveLast & "</a> ";
		}
		return output;
	}