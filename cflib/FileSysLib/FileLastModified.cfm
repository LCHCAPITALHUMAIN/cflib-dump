function FileLastModified(filename){
	var oFile = createObject("java","java.io.File");
	var oDate = createObject("java","java.util.Date");
	oFile.init(fileName);
	return oDate.init(oFile.lastModified());
}