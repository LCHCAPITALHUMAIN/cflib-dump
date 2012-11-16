function listToStructRepeatKeys(list){
  var myStruct=StructNew();
  var i=0;
  var delimiter=",";
  var tempVar="";

  if(arrayLen(arguments) gt 1) delimiter = arguments[2];

  for(i=listLen(list, delimiter); i gt 0; i=i-1) {
  	tempVar = trim(listGetAt(list, i, delimiter));
  	if (structKeyExists(myStruct,listFirst(tempVar, "="))) {
		myStruct[listFirst(tempVar, "=")] = listAppend(myStruct[listFirst(tempVar, "=")],listLast(tempVar, "="));
	} else {
		myStruct[listFirst(tempVar, "=")] = listLast(tempVar, "=");
	}
  }
  return myStruct;
}