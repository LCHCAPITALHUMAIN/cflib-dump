function GetContainer(theString, startIdentifier, endIdentifier){
	// some code based on Joshua Miller's RePlaceHolders()
	var startIdentifier_len  = Len(startIdentifier);
	var endIdentifier_len    = Len(endIdentifier);
	var container            = StructNew();

	var startIndex = 1;
	if(ArrayLen(Arguments) GTE 4) startIndex = Arguments[4];

	container.start      = 0;
	container.end        = 0;
	container.len        = 0;
	container.str        = 0;

	container.contents         = StructNew();
	container.contents.start   = 0;
	container.contents.end     = 0;
	container.contents.len     = 0;
	container.contents.str     = 0;

	container.start = FindNoCase(startIdentifier, theString, startIndex);
	if (container.start GT 0) {
		container.end      = FindNoCase(endIdentifier, theString, container.start+startIdentifier_len) + endIdentifier_len -1;
		container.len      = container.end - container.start +1;
		container.str      = Mid(theString, container.start, container.len);

		container.contents.start   = container.start + startIdentifier_len;
		container.contents.end     = container.end - endIdentifier_len;
		container.contents.len     = container.contents.end - container.contents.start +1;
		container.contents.str     = Mid(theString, container.contents.start, container.contents.len);
	}

	return container;
}