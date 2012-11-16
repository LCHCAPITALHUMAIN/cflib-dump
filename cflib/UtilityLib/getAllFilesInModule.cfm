function getAllFilesInModule(cvsdir, moduleName)	{
		var fileList = '';
		var curdir = arguments.moduleName;
		var myArray = ListToArray(arguments.cvsdir, chr(13));
		var myLength = ArrayLen(myArray);
		var temp = '';
		var i = 1;
		
		for( i = 1; i LTE myLength; i = i + 1)	{
			//WriteOutput(myArray[i] & '<br>');
			if(Find('Directory',myArray[i])) {
				curdir = Mid(myArray[i], Len('Directory ') + 1, Len(myArray[i])-Len('Directory '));
			}	else if(Trim(myArray[i]) NEQ '') {
				filelist = ListAppend(filelist, curdir & '/' & trim(myArray[i]) );
			}
			
		}
		return fileList;
	}