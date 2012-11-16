function ListDeleteMid(list, startPos, numElements) {
	var i=0;
	var delimiter=",";
	var finish=startPos+numElements-1;

	if (Arraylen(arguments) gt 3) {
		delimiter=arguments[4];
	}
	if (finish gt ListLen(list, delimiter)) {
    	finish = listLen(list,delimiter);
  	}
	for (i=startPos; i lte finish; i=i+1) {
		list=listDeleteAt(list, startpos, delimiter);
	}
	return list;
}