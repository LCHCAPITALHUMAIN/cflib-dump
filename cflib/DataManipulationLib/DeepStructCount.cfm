function deepStructCount(myStruct) {
    var deepCount=0;
    var x = "";
    var i = "";
        
    for (x in myStruct) { 
        if(isArray(myStruct[x])) {
            for(i=1; i lte arrayLen(myStruct[x]); i=i+1) {
                if(isStruct(myStruct[x][i])) deepCount = deepCount+deepStructCount(myStruct[x][i]);
            }
        } else if (isStruct(myStruct[x])) {
            deepCount=deepCount+deepStructCount(myStruct[x]);
        } else {
            deepCount=deepCount+1;
        }
    }
	return deepCount;
}