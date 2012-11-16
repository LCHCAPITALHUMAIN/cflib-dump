function queryToStructOfArrays(q){
		//a variable to hold the struct
		var st = structNew();
		//two variable for iterating
		var ii = 1;
		var cc = 1;
		//grab the columns into an array for easy looping
		var cols = listToArray(q.columnList);
		//iterate over the columns of the query and create the arrays of values
		for(ii = 1; ii lte arrayLen(cols); ii = ii + 1){
			//make the array with the col name as the key in the root struct
			st[cols[ii]] = arrayNew(1);
			//now loop for the recordcount of the query and insert the values
			for(cc = 1; cc lte q.recordcount; cc = cc + 1)
				arrayAppend(st[cols[ii]],q[cols[ii]][cc]);
		}
		//return the struct
		return st;
	}