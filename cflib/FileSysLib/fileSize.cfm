function fileSize(pathToFile) {
	var fileInstance = createObject("java","java.io.File").init(toString(arguments.pathToFile));
	var fileList = "";
	var ii = 0;
	var totalSize = 0;

	//if this is a simple file, just return it's length
	if(fileInstance.isFile()){
	    return fileInstance.length();
	}
	else if(fileInstance.isDirectory()) {
		fileList = fileInstance.listFiles();
		for(ii = 1; ii LTE arrayLen(fileList); ii = ii + 1){
		    totalSize = totalSize + fileSize(fileList[ii]);
		}
		return totalSize; 
	}
	else
		return 0;
}